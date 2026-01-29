FROM ubuntu:24.04

WORKDIR /workspace

RUN apt update && apt install -y \
    openjdk-17-jdk \
    git \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
