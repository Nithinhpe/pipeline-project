#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /opt/prod /tmp/.auth tester@15.112.153.254:/tmp/.auth
scp -i /opt/prod ./jenkins/deploy/publish.sh tester@15.112.153.254:~/publish.sh
ssh -i /opt/prod tester@15.112.153.254 "~/publish.sh"
