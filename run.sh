#!/bin/bash
USERNAME=$1
HOST_PORT=$2

if [ -z "$USERNAME" ] || [ -z "$HOST_PORT" ]; then
    echo "Usage: ./run.sh <username> <host_port>"
    exit 1
fi

docker run --privileged  --gpus all -it --rm \
  --name sfm-$USERNAME \
  -v "$(pwd)":/workspace \
  -p $HOST_PORT:8888 \
  sfm-env

