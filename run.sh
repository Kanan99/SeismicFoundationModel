#!/bin/bash
USERNAME=$1
if [ -z "$USERNAME" ]; then
  echo "Usage: ./run.sh <username>"
  exit 1
fi

docker run -it --name sfm-$USERNAME -v $(pwd):/workspace sfm-env:dev
