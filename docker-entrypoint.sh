#!/bin/bash
set -e

echo "Executing as: $(whoami)"
ls -al /workspace

bundle install

exec "$@"
