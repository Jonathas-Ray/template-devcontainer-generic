FROM ubuntu:24.04

WORKDIR /workspace

RUN apt update && apt install -y \
    curl \
    git \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
