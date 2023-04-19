#!/bin/bash

echo "***************************"
echo "** Building jar ***********"
echo "***************************"

WORKSPACE=/var/jenkins_home/workspace/pipeline-docker-maven/java-app
echo "$WORKSPACE"
docker run --rm  -v  $WORKSPACE:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
