#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

docker-compose up -d
docker-compose exec cachet make check-ready delay_seconds=5 max_try=30 -f /usr/local/bin/actions.mk
docker-compose exec cachet curl -Ls nginx | grep -q "Setup Cachet"
docker-compose down
