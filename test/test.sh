#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

# Preserve the failing response and service logs before removing the containers.
cleanup() {
    status=$?
    if [[ "${status}" -ne 0 ]]; then
        docker compose logs --no-color || true
        docker compose exec -T cachet sh -c 'cat storage/logs/*.log' || true
    fi
    docker compose down
    exit "${status}"
}
trap cleanup EXIT
docker compose up -d
docker compose exec -T cachet make check-ready max_try=10 -f /usr/local/bin/actions.mk
docker compose exec -T nginx make check-ready max_try=10 -f /usr/local/bin/actions.mk
docker compose exec -T cachet make init -f /usr/local/bin/actions.mk
response=$(docker compose exec -T cachet curl --fail --location --silent --show-error nginx)
if ! grep -q "Setup Cachet" <<< "${response}"; then
    printf '%s\n' "${response}"
    echo >&2 'Cachet setup page was not returned.'
    exit 1
fi
