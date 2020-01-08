#!/bin/bash

set -e

regex='refs/tags/v(.*)'

VERSION_STR=latest
if [[ $GITHUB_REF == refs/tags/v* ]]; then
	[[ $GITHUB_REF =~ $regex ]]
	VERSION_STR=${BASH_REMATCH[1]}
	echo version is $VERSION_STR
fi


docker login --username funkyway --password $DOCKER_TOKEN
docker build -t funkyway/github-action-test:${VERSION_STR} .
docker push funkyway/github-action-test:{VERSION_STR}
