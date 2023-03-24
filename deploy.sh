#!/bin/bash
set -e

APP_NAME="todo-app-front"
RELEASE_NAME="${APP_NAME}::${GITHUB_SHA::6}"
#DOCKER HUB LOGIN
echo "$DOCKER_TOKEN" | docker login -u "$DOCKER_USERNAME" --password-stdin
IMAGE_NAME="$DOCKER_USERNAME/$RELEASE_NAME"
#IMAGE BUILDING
docker build -t ${IMAGE_NAME} .
#IMAGE PUSHING
docker push ${IMAGE_NAME}
