FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y wget

# Set pgcat version
ENV PGCAT_VERSION 1.2.0

# Download pgcat
RUN wget https://github.com/levlaz/pgcat/releases/download/v${PGCAT_VERSION}/pgcat-v${PGCAT_VERSION}-linux-amd64.tar.gz -O pgcat.tar.gz || \
    (echo "Failed to download pgcat. Please check the version and try again." && exit 1)

# Extract pgcat
RUN tar -xzvf pgcat.tar.gz || (echo "Failed to extract pgcat. The downloaded file may be corrupt." && exit 1)

# Move pgcat to /usr/local/bin
RUN mv pgcat /usr/local/bin/

# Clean up
RUN rm pgcat.tar.gz

COPY pgcat.toml /etc/pgcat.toml

CMD ["pgcat", "-c", "/etc/pgcat.toml"]