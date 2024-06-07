#!/bin/bash
set -e

if [ ! -f Gemfile ]; then
  echo "Gemfile seems to be missing"
  echo ""
  exit 1
fi

bundle install --retry 5 --jobs 20

exec "$@"