# Migrate

A simple dockerized version of [Migrate](https://github.com/golang-migrate/migrate). It includes two profiles for the docker compose:

# Docker Compose Profiles

## Up

Can be run with:

```shell
docker compose --profile update up
```

Will try to apply all migrations.

## Down

Can be run with:

```shell
ROLLBACK_COUNT=N docker compose --profile rollback up
```

Will try to rollback N migrations.

# Docker Wrapper

A wrapper around the migrate docker image is also provided in form of the `./migrate.sh` file. Any commands of the migrate CLI will work with the wrapper. It will mount the path for the migrations to `$PWD/migrations`, this will also set the dir for the `create` command.

So instead of:

```shell
docker run -v ./migrations/:/migrations/ --network host -it migrate/migrate -path=/migrations/ <COMMAND>
```

One can simply run:

```shell
./migrate.sh <COMMAND>
```