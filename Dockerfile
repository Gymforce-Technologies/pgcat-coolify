FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/levlaz/pgcat/releases/download/v1.1.1/pgcat-v1.1.1-linux-amd64.tar.gz
RUN tar -xzvf pgcat-v1.1.1-linux-amd64.tar.gz
RUN mv pgcat /usr/local/bin/
RUN rm pgcat-v1.1.1-linux-amd64.tar.gz

COPY pgcat.toml /etc/pgcat.toml

CMD ["pgcat", "-c", "/etc/pgcat.toml"]