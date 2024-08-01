# Use a base image that has the necessary environment to run pgcat
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y wget tar

# Download and install pgcat
RUN wget https://github.com/pgcat/pgcat/releases/download/v0.1.0/pgcat-linux-amd64.tar.gz && \
    tar -xzf pgcat-linux-amd64.tar.gz && \
    mv pgcat /usr/local/bin/pgcat && \
    rm pgcat-linux-amd64.tar.gz

# Copy the pgcat configuration file
COPY pgcat.conf /etc/pgcat/pgcat.conf

# Expose pgcat port
EXPOSE 5432

# Run pgcat
CMD ["pgcat", "-c", "/etc/pgcat/pgcat.conf"]
