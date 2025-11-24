# Dockerfile for Sega Saturn PowerRings Build Environment
FROM ubuntu:20.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install essential build tools and dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    make \
    git \
    wget \
    curl \
    texinfo \
    bison \
    flex \
    libgmp-dev \
    libmpfr-dev \
    libmpc-dev \
    zlib1g-dev \
    libssl-dev \
    python3 \
    python3-pip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /build

# Set up the build workspace first
WORKDIR /workspace

# Clone and build SH-2 cross compiler (GCC for Sega Saturn)
# Put it in the location the makefile expects (../../Compiler relative to /workspace/satiator-rings)
RUN cd /workspace && \
    git clone https://github.com/johannes-fetz/compiler.git Compiler && \
    cd Compiler && \
    chmod +x INSTALL_PREREQUISITES.sh && \
    chmod +x INSTALL_LINUX.sh

# Clone Jo Engine in the expected location
RUN cd /workspace && \
    git clone https://github.com/johannes-fetz/joengine.git jo_engine

# Set environment variables for build
ENV COMPILER_DIR=/workspace/Compiler
ENV JO_ENGINE_SRC_DIR=/workspace/jo_engine
ENV PATH="${COMPILER_DIR}/LINUX/bin:${PATH}"

# Copy build helper script
COPY docker-build.sh /usr/local/bin/build.sh
RUN chmod +x /usr/local/bin/build.sh

CMD ["/bin/bash"]
