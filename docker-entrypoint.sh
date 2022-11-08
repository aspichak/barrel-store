#!/bin/bash

if [ -z "$*" ]; then
  [ "$RAILS_ENV" = "production" ] && rails s || foreman s -f Procfile.dev
else
  exec bundle exec "$@"
fi
