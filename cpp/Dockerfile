FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /workspace

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    ca-certificates \
    cmake \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Instala PlatformIO Core CLI via pip
RUN pip3 install platformio --break-system-packages

# Pré-aquece o cache do PlatformIO (opcional, acelera o primeiro uso)
RUN platformio --version
