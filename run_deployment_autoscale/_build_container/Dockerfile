# DEV OPS
FROM ubuntu:latest 

# Set the work directory inside the container
WORKDIR /DEVOPS

# Copy the necessary Python files (adjust paths if needed)
COPY *.dogk *.py *.log .

# Install required packages for building Python dependencies (in builder stage)
RUN apt-get update && apt-get install -y \
    build-essential\
    stress-ng \
    cloc \
    python3 \
    python3-dev \
    python3-venv \
    python3-zmq

# Install tools for development and networking (in final stage)
RUN apt-get update && apt-get install -y \
    vim \
    apt-utils \
    curl \
    wget \
    netcat-traditional \
    ssh \
    iputils-ping

# Set permissions for directories
RUN chmod ugo+rwx /DEVOPS 

# Set permissions for startup scripts
RUN chmod ugo+rwx /DEVOPS/*

# Expose ports for SSH and additional service (if needed)
EXPOSE 22
EXPOSE 3

# END
