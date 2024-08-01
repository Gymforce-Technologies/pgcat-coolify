# Use a base image that has the necessary environment to run pgcat
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y wget tar && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Download and install pgcat
RUN wget https://github.com/postgresml/pgcat/archive/refs/tags/pgcat-0.1.0.tar.gz && \
    tar -xzf pgcat-0.1.0.tar.gz && \
    mv pgcat-0.1.0/pgcat /usr/local/bin/pgcat && \
    rm -rf pgcat-0.1.0.tar.gz pgcat-0.1.0

# Copy the pgcat configuration file
COPY pgcat.conf /etc/pgcat/pgcat.conf

# Expose pgcat port
EXPOSE 5435

# Run pgcat
CMD ["pgcat", "-c", "/etc/pgcat/pgcat.conf"]
