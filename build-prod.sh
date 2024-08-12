#!/bin/sh
IMAGE_NAME=ws
IMAGE_TAG="$(cat VERSION)"
IMAGE_FULL="${IMAGE_NAME}:${IMAGE_TAG}"
printf 'Image tag is: %s\n' "${IMAGE_FULL}"

eval_args(){
  ARG="${1}"
  case "${ARG}" in
    "run")
      docker run -p8080:8080 -v"$PWD:/home/node/app"  --rm -it "${IMAGE_FULL}"
      ;;
  esac
}

docker image rm "${IMAGE_FULL}"
docker build -f images/Dockerfile -t "${IMAGE_FULL}" .
[ -n "${1}" ] && eval_args "${1}"

