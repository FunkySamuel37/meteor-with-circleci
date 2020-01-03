#!/bin/bash
set -e

apt-get update

apt-get install -y --no-install-recommends curl ca-certificates bzip2 bsdtar build-essential python git
