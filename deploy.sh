#!/bin/bash
set -e

if !(git pull --quiet origin main && ([ -d "venv" ] || python3 -m venv venv) && \
   source venv/bin/activate && pip install -r requirements.txt && \
   python manage.py migrate --noinput && \
   ./node_modules/.bin/parcel build bundles-src/index.js --dist-dir bundles --public-url="./" \
    && python manage.py collectstatic --clear --noinput && systemctl restart star-burger);
then
  exit_code=$?
  echo "Something went wrong: exit code $exit_code" >&2
  exit $exit_code
fi

deactivate

git_commit_id=$(git rev-parse --short HEAD)
rb_key=$(grep -i 'ROLLBAR_KEY=' /etc/systemd/system/star-burger.env | cut -f2 -d'=' | cut -f2 -d'"')
curl -H 'Content-Type: application/json' -H "X-Rollbar-Access-Token: $rb_key" --data "{\"environment\":
\"development\", \"revision\": \"$git_commit_id\", \"local_username\": \"django\"}"  --request POST https://api.rollbar.com/api/1/deploy

echo "Deployment complete"
