#!/bin/sh
IMAGE_NAME=ws
IMAGE_TAG=dev
[ -n "$1" ] && printf 'Overrriding tag with %s\n' "$1" && IMAGE_TAG="$1"
IMAGE_FULL="${IMAGE_NAME}:${IMAGE_TAG}"
printf 'Image tag is: %s\n' "${IMAGE_FULL}"

set -x
docker build  -f images/Dockerfile.dev -t "${IMAGE_FULL}" .
EC_BUILD="$?"
[ "$EC_BUILD" != 0 ] && echo "Build has failed check the logs" && exit 1
docker run -p8080:8080 -v"$PWD:/home/node/app" --rm -it "${IMAGE_FULL}"
set +x
