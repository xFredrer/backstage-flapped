FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    build-essential \
    ca-certificates \
    curl \
    dnsutils \
    git \
    make \
    pkg-config \
    python3 \
    python3-pip \
    python3-venv \
    wget \
    xz-utils \
    bsdmainutils \
    binutils-mips-linux-gnu \
    gcc-mips-linux-gnu \
    libc6-dev-mips-cross \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
ENV PATH="/workspace/tools:/workspace/bin:${PATH}"

CMD ["/bin/bash"]
