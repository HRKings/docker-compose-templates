#! /usr/bin/bash

dbmate_docker_wrapper() {
    MIGRATE_WARNING_MESSAGE="\x1b[33;40;1m WARNING: the path is always set to './migrations' \x1b[0m \n"

    if (( $# == 0 )); then
        echo "A simple way to execute DbMate using docker"
        echo "usage: $0 [dbmate options]"

        printf "$MIGRATE_WARNING_MESSAGE"

        docker run ghcr.io/amacneil/dbmate:main --help && printf "$MIGRATE_WARNING_MESSAGE"

        return $?;
    fi

    if [[ $1 = '--help' ]]; then
        printf "$MIGRATE_WARNING_MESSAGE"

        docker run ghcr.io/amacneil/dbmate:main --help && printf "$MIGRATE_WARNING_MESSAGE"

        return $?;
    fi

    if [[ $* =~ 'create' ]]; then
        printf "$MIGRATE_WARNING_MESSAGE"

        TEMP_ARRAY=("$@")
        docker run -v ./migrations/:/db/migrations/ --network host ghcr.io/amacneil/dbmate:main new "${TEMP_ARRAY[@]:1}"

        return $?;
    fi

    printf "$MIGRATE_WARNING_MESSAGE"

    docker run -v ./migrations/:/db/migrations/ --network host -it ghcr.io/amacneil/dbmate:main "$@"
}

dbmate_docker_wrapper "$@"
