FROM postgres:18 AS build

WORKDIR /tmp

RUN apt-get update

RUN apt-get install -y --no-install-recommends ca-certificates wget

RUN wget https://github.com/pksunkara/pgx_ulid/releases/download/v0.2.1/pgx_ulid-v0.2.1-pg18-amd64-linux-gnu.deb

RUN dpkg -i ./pgx_ulid-v0.2.1-pg18-amd64-linux-gnu.deb
