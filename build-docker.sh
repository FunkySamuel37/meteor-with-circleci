#!/bin/bash

set -e

docker login --username funkyway --password $DOCKER_TOKEN
docker build -t funkyway/github-action-test:latest .
docker push funkyway/github-action-test:latest
