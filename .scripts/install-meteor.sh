#!/bin/bash
set -e

METEOR_VERSION=$(head $APP_SOURCE_DIR/.meteor/release | cut -d "@" -f 2)

curl -v https://install.meteor.com?release=$METEOR_VERSION -o /tmp/install_meteor.sh
sh /tmp/install_meteor.sh
