# Seismic Foundation Model - Docker Environment



Run the following command from the project root:

```bash
docker build -t sfm-env .

docker run -it -v $(pwd):/workspace sfm-env

## If you use jupyter notebook:

docker run --gpus all -it -p 8888:8888 -v $(pwd):/workspace/ sfm-env

jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=''

