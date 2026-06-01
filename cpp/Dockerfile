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

# Instala PlatformIO Core CLI
RUN pip3 install platformio --break-system-packages

# Pré-aquece o cache do PlatformIO
RUN platformio --version

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
