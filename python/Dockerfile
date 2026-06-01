FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /workspace

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Garante que pip está atualizado sem quebrar pacotes do sistema
RUN pip3 install --upgrade pip --break-system-packages

# Instala pacotes comuns de desenvolvimento
RUN pip3 install \
    requests \
    python-dotenv \
    mysql-connector-python \
    psycopg2-binary \
    pymongo \
    --break-system-packages
