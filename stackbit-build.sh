#!/usr/bin/env bash

set -e
set -o pipefail
set -v

if [[ -z "${STACKBIT_API_KEY}" ]]; then
    echo "WARNING: No STACKBIT_API_KEY environment variable set, skipping stackbit-pull"
else
    npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://dev-api.stackbit.com/pull/5d4c33b1bbe7ce0010d8e91a 
fi
gem install jekyll bundler && bundle install && bundle exec jekyll build
./inject-netlify-identity-widget.js _site
