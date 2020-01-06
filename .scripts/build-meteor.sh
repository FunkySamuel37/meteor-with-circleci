#!/bin/bash

set -e
export BUNDLE_DIR=${HOME}/bundle
echo "NPM_TOKEN is $NPM_TOKEN"
if [[ "$NPM_TOKEN" ]]; then
  echo "//registry.npmjs.org/:_authToken=$NPM_TOKEN" >> ~/.npmrc
fi

export METEOR_ALLOW_SUPERUSER=true
meteor npm ci


echo $BUILD_FLAGS
echo "---build meteor start--->"

meteor build ../ --directory --architecture os.linux.x86_64 --server-only
