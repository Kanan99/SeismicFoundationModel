# Dockerfile for SFM Environment
FROM nvidia/cuda:11.1.1-devel-ubuntu20.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# Add deadsnakes PPA for Python 3.9
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update

# Install system dependencies
RUN apt-get install -y \
    python3.9 \
    python3.9-dev \
    python3.9-distutils \
    build-essential \
    wget \
    curl \
    git \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

# Install pip for python3.9
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.9 get-pip.py
RUN rm get-pip.py

# Make python3.9 the default python
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1

# Set working directory
WORKDIR /workspace

# Install PyTorch with CUDA 11.1 support
RUN pip3 install torch==1.8.1+cu111 torchvision==0.9.1+cu111 torchaudio==0.8.1 \
    -f https://download.pytorch.org/whl/lts/1.8/torch_lts.html

# Install specific timm version
RUN pip3 install timm==0.3.2

# Install other requirements
RUN pip3 install \
    scikit-learn \
    matplotlib \
    tensorboard \
    numpy \
    Pillow \
    jupyter

# Copy your code (optional - you can also mount as volume)
# COPY . /workspace/

# Create directory for data and models
RUN mkdir -p /workspace/models /workspace/data /workspace/results

# Expose port for Jupyter if needed
EXPOSE 8888

# Default command
CMD ["/bin/bash"]
