# Use an official base image
FROM ubuntu:latest

# Set metadata as described at https://docs.docker.com/engine/reference/builder/#label
LABEL maintainer="contact@sebasarriaza.com" \
      version="1.0" \
      description="Docker image with Foundry and Node.js for the smart contract development"

# Set the environment variables (modify according to your needs)
ENV PATH="/root/.foundry/bin:${PATH}"

# Install prerequisites
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    cargo \
    rustc \
    && rm -rf /var/lib/apt/lists/*

# Install Foundry using Foundryup
RUN curl -L https://foundry.paradigm.xyz | bash

# Execute foundryup to complete the Foundry installation
RUN /root/.foundry/bin/foundryup

# Install Node.js 18 using Nodesource
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

# Set working directory
WORKDIR /workspace

# Command to run when the container starts
CMD ["bash"]
