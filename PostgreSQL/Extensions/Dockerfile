FROM postgres:17 AS build

WORKDIR /tmp

RUN apt-get update

RUN apt-get install -y --no-install-recommends ca-certificates wget

RUN wget https://github.com/pksunkara/pgx_ulid/releases/download/v0.2.0/pgx_ulid-v0.2.0-pg17-amd64-linux-gnu.deb

RUN dpkg -i ./pgx_ulid-v0.2.0-pg17-amd64-linux-gnu.deb
