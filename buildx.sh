#!/bin/bash
TAG=v5.1.1
TARGETS=linux/arm64,linux/amd64,linux/arm/v7,linux/i386

docker buildx build --platform=${TARGETS} -t knegge/gr-satellites:${TAG} . --push --no-cache

