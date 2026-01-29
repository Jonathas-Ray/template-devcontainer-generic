FROM ubuntu:24.04

WORKDIR /workspace

RUN apt update && apt install -y \
    build-essential \
    git \
    curl \
    ca-certificates \
    cmake \
    arduino-cli \
    && rm -rf /var/lib/apt/lists/*
