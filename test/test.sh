#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

docker-compose up -d
docker-compose exec cachet make check-ready max_try=10 -f /usr/local/bin/actions.mk
docker-compose exec nginx make check-ready max_try=10 -f /usr/local/bin/actions.mk
docker-compose exec cachet make init -f /usr/local/bin/actions.mk
docker-compose exec cachet curl -Ls nginx | grep -q "Setup Cachet"
docker-compose down
