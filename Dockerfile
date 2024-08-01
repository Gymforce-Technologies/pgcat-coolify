FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y wget

# Download the latest release of pgcat
RUN wget $(wget -qO- https://api.github.com/repos/levlaz/pgcat/releases/latest | grep browser_download_url | grep linux-amd64 | cut -d '"' -f 4)

# Extract the downloaded file
RUN tar -xzvf pgcat-*-linux-amd64.tar.gz

# Move pgcat to /usr/local/bin
RUN mv pgcat /usr/local/bin/

# Remove the downloaded tar.gz file
RUN rm pgcat-*-linux-amd64.tar.gz

COPY pgcat.toml /etc/pgcat.toml

CMD ["pgcat", "-c", "/etc/pgcat.toml"]