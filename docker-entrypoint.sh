#!/bin/bash
set -e

if [ -f Gemfile ]; then
    bundle install
fi

exec "$@"
