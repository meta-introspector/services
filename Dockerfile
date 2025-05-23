#FROM node:23.3.0-slim AS builder
#FROM ubuntu:24.04 
FROM eniocarboni/docker-ubuntu-systemd


RUN apt-get update && \
    apt-get install -y curl git python3 make g++ unzip build-essential openssl libssl-dev libsecret-1-dev dos2unix wget snapd
    # && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

#RUN npm install -g bun@1.2.5 turbo@2.3.3

#RUN ln -s /usr/bin/python3 /usr/bin/python

#FROM builder as installer 

# Copy package files
# COPY .npmrc .
# COPY package.json .
# COPY turbo.json .
# COPY tsconfig.json .
# COPY lerna.json .
# COPY renovate.json .
# COPY scripts ./scripts
# COPY packages ./packages

# RUN bun install --no-cache

# # Install dependencies
# RUN bun install

# # Build the project
# RUN bun run build

# Create a new stage for the final image
#FROM builder
WORKDIR /opt/services/scripts/

#ADD scripts/runsolana.sh /opt/services/scripts/runsolana.sh 
#ADD scripts/bootstrap.sh /opt/services/scripts/bootstrap.sh 
#ADD scripts/bootstrap2.sh /opt/services/scripts/bootstrap2.sh 
#ADD scripts/bootstrap3.sh /opt/services/scripts/bootstrap3.sh 
#ADD scripts/setup-kernel.sh /opt/services/scripts/setup-kernel.sh
#ADD scripts/setup-swap.sh /opt/services/scripts/setup-swap.sh
#ADD scripts/get_secrets_solana.sh /opt/services/scripts/get_secrets_solana.sh
ADD scripts/userdata.sh /opt/services/scripts/userdata.sh
RUN dos2unix /opt/services/scripts/userdata.sh
RUN /bin/bash /opt/services/scripts/userdata.sh

#ADD systemd/solana.service /opt/services/systemd/solana.service
#RUN dos2unix /opt/services/systemd/solana.service

