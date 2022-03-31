#!/bin/bash
set -e

if git pull; then
  echo "The deploy was successful" >&2
else
  exit_code=$?
  echo "The deploy has failed with exit code $exit_code" >&2
  exit $exit_code
fi
