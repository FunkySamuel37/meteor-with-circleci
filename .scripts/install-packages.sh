#!/bin/bash

set -e

export BUNDLE_DIR=${HOME}/bundle
if [[ "$NPM_TOKEN" ]]; then
  echo "//registry.npmjs.org/:_authToken=$NPM_TOKEN" >> ~/.npmrc
fi

meteor npm ci
