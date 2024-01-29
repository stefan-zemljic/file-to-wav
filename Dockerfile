# Use Ubuntu as the base image
FROM ubuntu:latest

# Update the system and install necessary tools
RUN apt-get update && apt-get install -y \
    tar \
    gzip

# Copy the tar.gz file into the Docker container
COPY piper_amd64.tar.gz /tmp

# Unpack the tar.gz file
RUN tar -xzf /tmp/piper_amd64.tar.gz -C /opt

# Clean up
RUN rm /tmp/piper_amd64.tar.gz

# Add /opt/piper to the PATH
ENV PATH="/opt/piper:${PATH}"

# Set the working directory
WORKDIR /root/workdir
