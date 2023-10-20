#! /usr/bin/bash

migrate_docker_wrapper() {
    MIGRATE_WARNING_MESSAGE="\x1b[33;40;1m WARNING: the path is always set to './migrations' \x1b[0m \n"
    CREATE_WARNING_MESSAGE="\x1b[33;40;1m WARNING: the dir has been set to './migrations' \x1b[0m \n"

    if (( $# == 0 )); then
        echo "A simple way to execute migrate using docker"
        echo "usage: $0 [migrate options]"

        printf "$MIGRATE_WARNING_MESSAGE"

        docker run migrate/migrate --help && printf "$MIGRATE_WARNING_MESSAGE"

        return $?;
    fi

    if [[ $1 = '--help' ]]; then
        printf "$MIGRATE_WARNING_MESSAGE"

        docker run migrate/migrate --help && printf "$MIGRATE_WARNING_MESSAGE"

        return $?;
    fi

    if [[ $@ =~ 'create' ]]; then
        printf "$CREATE_WARNING_MESSAGE"

        TEMP_ARRAY=("$@")
        docker run -v ./migrations/:/migrations/ --network host migrate/migrate create -dir=/migrations/ ${TEMP_ARRAY[@]:1}

        return $?;
    fi

    printf "$MIGRATE_WARNING_MESSAGE"

    docker run -v ./migrations/:/migrations/ --network host -it migrate/migrate -path=/migrations/ $@
}

migrate_docker_wrapper $@