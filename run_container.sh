#!/bin/bash

DOCKER_IMG="mu777/cuda-jupyter"
DOCKER_TAG="latest"

docker run --rm -itd --gpus all \
  -v /etc/group:/etc/group:ro \
  -v /etc/passwd:/etc/passwd:ro \
  -v /etc/shadow:/etc/shadow:ro \
  -u $(id -u $USER):$(id -g $USER) \
  -v $HOME/.vscode-server:$HOME/.vscode-server \
  -v ${PWD}/../:${PWD}/../ \
  -w ${PWD}/../ \
  --name cuda-jupyter \
  $DOCKER_IMG:$DOCKER_TAG /bin/sh -c "while : ; do sleep 3; done"
