#!/bin/bash

echo "***************************"
echo "** Testing the code ***********"
echo "***************************"

/usr/bin/docker login docker.io -u nithinhpe -p Nithin@1271
docker run --rm  -v  $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
docker logout