#!/bin/bash

set -e

if [[ "$NPM_TOKEN" ]]; then
  echo "//registry.npmjs.org/:_authToken=$NPM_TOKEN" >> ~/.npmrc
fi

export METEOR_ALLOW_SUPERUSER=true
meteor npm ci


echo $BUILD_FLAGS
echo ---build meteor start--->

export METEOR_PROFILE=1
meteor build ../bundle --directory --architecture os.linux.x86_64 --server-only
