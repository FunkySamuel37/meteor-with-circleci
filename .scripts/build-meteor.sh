#!/bin/bash

set -e
export BUNDLE_DIR=${HOME}/bundle
echo "NPM_TOKEN is $NPM_TOKEN"
if [[ "$NPM_TOKEN" ]]; then
  echo "//registry.npmjs.org/:_authToken=$NPM_TOKEN" >> ~/.npmrc
fi

meteor npm install

meteor build --directory $BUNDLE_DIR $BUILD_FLAGS
