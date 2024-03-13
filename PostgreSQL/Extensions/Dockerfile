FROM postgres:16 as build

WORKDIR /tmp

RUN apt-get update

RUN apt-get install -y --no-install-recommends ca-certificates wget

RUN wget https://github.com/pksunkara/pgx_ulid/releases/download/v0.1.4/pgx_ulid-v0.1.4-pg16-amd64-linux-gnu.deb

RUN dpkg -i ./pgx_ulid-v0.1.4-pg16-amd64-linux-gnu.deb
