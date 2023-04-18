#!/bin/bash

export IMAGE=$(sed -n '1p' /tmp/.auth)
export TAG=$(sed -n '2p' /tmp/.auth)
export PASS=$(sed -n '3p' /tmp/.auth)
echo "$IMAGE"
echo "$TAG"
podman login -u nithinhpe -p Nithin@1271
podman run docker.io/nithinhpe/$IMAGE:$TAG
