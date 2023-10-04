FROM postgres:16 as build

WORKDIR /tmp

USER root

RUN apt-get update

RUN apt-get install -y --no-install-recommends ca-certificates wget

RUN wget https://github.com/HRKings/pgx_ulid/releases/download/v0.1.4-alternate/pgx_ulid-v0.1.4-alternate-pg16-amd64-linux-gnu.deb

RUN dpkg -i ./pgx_ulid-v0.1.4-alternate-pg16-amd64-linux-gnu.deb
