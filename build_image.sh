#!/bin/bash

DOCKER_IMG="mu777/cuda-jupyter"
DOCKER_TAG="latest"
(
  cd $(dirname $0)  
  docker build -t $DOCKER_IMG:$DOCKER_TAG -f ./Dockerfile .
)
