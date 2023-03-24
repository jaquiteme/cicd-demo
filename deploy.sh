#!/bin/bash
set -e
#DOCKER HUB LOGIN
echo "$DOCKER_TOKEN" | docker login -u "$DOCKER_USERNAME" --password-stdin
IMAGE_NAME="$DOCKER_USERNAME/motd-api:${TRAVIS_COMMIT::6}"
#IMAGE BUILDING
docker build -t ${IMAGE_NAME} .
#IMAGE PUSHING
docker push ${IMAGE_NAME}
# GCP KUBERNETES
kubectl set image deployment/motd-api motd-api=${IMAGE_NAME} --record --namespace jordy-aquiteme
