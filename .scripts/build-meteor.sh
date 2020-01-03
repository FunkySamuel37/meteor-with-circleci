#!/bin/bash

set -e

if [[ "$NPM_TOKEN" ]]; then
  echo "//registry.npmjs.org/:_authToken=$NPM_TOKEN" >> ~/.npmrc
fi

export METEOR_ALLOW_SUPERUSER=true

meteor npm ci


echo $BUILD_FLAGS
meteor build ../bundle --directory --architecture os.linux.x86_64 --server-only
