FROM ubuntu:24.04

WORKDIR /workspace

RUN apt update && apt install -y \
    python3 \
    python3-pip \
    git \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Instala pacotes comuns
RUN pip3 install --upgrade pip
