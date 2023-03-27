#!/bin/bash
set -e

APP_NAME="todo-app-front"
VERSION="${GITHUB_SHA::6}"
IMAGE_ID="${APP_NAME}:${VERSION}"
IMAGE_NAME="$DOCKER_USERNAME/$RELEASE_NAME"

#DOCKER HUB LOGIN
echo "$DOCKER_TOKEN" | docker login -u "$DOCKER_USERNAME" --password-stdin
#IMAGE BUILDING
docker build -t ${IMAGE_NAME} .
#IMAGE PUSHING
docker push ${IMAGE_NAME}
