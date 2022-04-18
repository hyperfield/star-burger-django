#!/bin/bash
set -e

if git pull; then
  echo "Refreshed local repository code" >&2
else
  exit_code=$?
  echo "Could not refresh local repository code: exit code $exit_code" >&2
  exit $exit_code
fi

if [ ! -d "venv" ]; then
  if [ python -m venv venv ]; then
    echo "Created Python virtual environment directory venv" >&2
  else
    exit_code=$?
    echo "Could not create virtual environment directory venv: exit code $exit_cide" >&2
  fi
else
  echo "Virtual environment directory venv already exists"
fi

if [ source venv/bin/activate ]; then
  echo "Activated Python virtual environment" >&2;

  if [ pip install -r requirements.txt ]; then
    echo "Python requirements have been installed" >&2
  else
    exit_code=$?
    echo "Could not install Python requirements: exit code $exit_code" >&2
    exit $exit_code
  fi

  if [ python manage.py migrate ]; then
    echo "Django DB migrations were successful" >&2
  else
    exit_code=$?
    echo "Django DB migrations did not complete" >&2
    exit $exit_code
  fi
  
  deactivate;
else
  exit_code=$?
  echo "Could not activate Python virtual environment: exit code $exit_code" >&2
  exit $exit_code
fi

if [ npm ci --dev ]; then
  echo "Installed Node.js requirements" >&2
else
  exit_code=$?
  echo "Could not install Node.js requirements" >&2
  exit $exit_code
fi

if [ ./node_modules/.bin/parcel watch bundles-src/index.js --dist-dir bundles --public-url="./" ]; then
  echo "JS front-end has been assembled" >&2
else
  exit_code=$?
  echo "Could not assemble JS front-end" >&2
  exit $exit_code
fi

if [ python manage.py collectstatic ]; then
  echo "Django statics have been collected" >&2
else
  exit_code=$?
  echo "Could not collect Django statics" >&2
  exit $exit_code
fi

if [ systemctl restart star-burger ]; then
  echo "The star-burger instance has been re/started" >&2
else
  exit_code=$?
  echo "Could not re/start star-burger" >&2
  exit $exit_code
fi

echo "Deployment complete"
