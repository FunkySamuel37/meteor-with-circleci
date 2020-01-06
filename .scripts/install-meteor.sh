#!/bin/bash
set -e

curl -v https://install.meteor.com?release=$METEOR_VERSION -o /tmp/install_meteor.sh
sh /tmp/install_meteor.sh
