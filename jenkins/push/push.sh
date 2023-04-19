#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="maven-project"

echo "** Logging in ***"
/usr/bin/docker login docker.io -u nithinhpe -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG nithinhpe/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push nithinhpe/$IMAGE:$BUILD_TAG
