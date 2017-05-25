#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

docker-compose up -d
docker-compose exec postgres make check-ready max_try=12 wait_seconds=5 -f /usr/local/bin/actions.mk
docker-compose exec cachet make init -f /usr/local/bin/actions.mk
docker-compose down
