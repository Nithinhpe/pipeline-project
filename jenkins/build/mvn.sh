#!/bin/bash

echo "***************************"
echo "** Building jar ***********"
echo "***************************"

echo "$WORKSPACE"
/usr/bin/docker login -u nithinhpe -p Nithin@1271
docker run --rm  -v  $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
docker logout
              
