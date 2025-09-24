ERNAME=$1
HOST_PORT=$2
if [ -z "$USERNAME" ] || [ -z "$HOST_PORT" ]; then
	  echo "Usage: ./run-jupyter.sh <username> <host_port>"
	    exit 1
fi

docker run --gpus all -it \
	  --name sfm-$USERNAME-jupyter \
	    -p $HOST_PORT:8888 \
	      -v $(pwd):/workspace \
	        sfm-env:dev
