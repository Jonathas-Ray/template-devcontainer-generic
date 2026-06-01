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

RUN pip3 install --upgrade pip --break-system-packages

# Conectores de banco e utilitários comuns
RUN pip3 install \
    requests \
    python-dotenv \
    mysql-connector-python \
    psycopg2-binary \
    pymongo \
    pytest \
    pytest-cov \
    --break-system-packages

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
