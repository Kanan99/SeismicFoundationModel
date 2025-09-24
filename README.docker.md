eismic Foundation Model – Docker Environment

This repository provides a Docker environment for running and developing the Seismic Foundation Model (SFM). Follow the steps below to build and run containers consistently across the team.

## Setup

### 1. Build the Image
Run the provided script:

```bash
./build.sh
```

This will build the image and tag it as `sfm-env:dev`.

### 2. Run an Interactive Shell
Start a development container:

```bash
./run.sh <username>
```

* Replace `<username>` with your name/ID (e.g. `alice`, `bob`).
* This mounts the current project directory into `/workspace` inside the container.
* Your container will be named `sfm-<username>`.

### 3. Run Jupyter Notebook
Start a Jupyter container with GPU support:

```bash
./run-jupyter.sh <username> <host_port>
```

Example:

```bash
./run-jupyter.sh alice 8888
./run-jupyter.sh bob 8889
```

Then, inside the container, start Jupyter:

```bash
jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=''
```

* Each person should use a unique `<host_port>` (e.g. 8888, 8889, 8890).
* The container will be named `sfm-<username>-jupyter`.

## Useful Commands

* List running containers:
```bash
docker ps
```

* Reattach to a running container:
```bash
docker exec -it sfm-<username> bash
```

* Stop a container:
```bash
docker stop sfm-<username>
```

* Remove a stopped container:
```bash
docker rm sfm-<username>
```

## Team Policy & Best Practices

* **Naming**: Always use `--name sfm-<username>` (or `sfm-<username>-jupyter`).
* **Ports**: Use unique host ports to avoid conflicts (`8888`, `8889`, `8890`, …).
* **Volumes**: Keep work in `/workspace` so it persists on the host.
* **Cleanup**: Use `docker stop` + `docker rm` when done.
* **Throwaway runs**: Use `--rm` if you don't need to keep the container.

## Scripts

The following helper scripts are included for convenience. Make them executable with:

```bash
chmod +x build.sh run.sh run-jupyter.sh
```

With these scripts, everyone on the team can build, run, and manage containers in a consistent way without remembering long Docker commands.
