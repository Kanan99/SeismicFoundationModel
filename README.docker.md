# Seismic Foundation Model - Docker Environment



Run the following command from the project root:

```bash
docker build -t sfm-env .

docker run -it -v $(pwd):/workspace sfm-env

