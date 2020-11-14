#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

docker-compose up -d
docker-compose exec -T cachet make check-ready max_try=10 -f /usr/local/bin/actions.mk
docker-compose exec -T nginx make check-ready max_try=10 -f /usr/local/bin/actions.mk
docker-compose exec -T cachet make init -f /usr/local/bin/actions.mk
docker-compose exec -T cachet curl -Ls nginx | grep -q "Setup Cachet"
docker-compose down
