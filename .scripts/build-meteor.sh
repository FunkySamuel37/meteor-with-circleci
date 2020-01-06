#!/bin/bash

set -e

meteor build ../ --directory --architecture os.linux.x86_64 --server-only

cd ../bundle/programs/server && npm install
