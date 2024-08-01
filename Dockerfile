FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y curl
RUN curl -L https://github.com/levlaz/pgcat/releases/download/v1.1.1/pgcat-v1.1.1-linux-amd64.tar.gz | tar xz
RUN mv pgcat /usr/local/bin/

COPY pgcat.toml /etc/pgcat.toml

CMD ["pgcat", "-c", "/etc/pgcat.toml"]