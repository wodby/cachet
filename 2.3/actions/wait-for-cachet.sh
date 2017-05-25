#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

started=0
max_try=$1
wait_seconds=$2
delay_seconds=$3

sleep "${delay_seconds}"

for i in $(seq 1 "${max_try}"); do
    if cat /home/www-data/.initialized &> /dev/null; then
        started=1
        break
    fi
    echo 'Cachet is initializing...'
    sleep "${wait_seconds}"
done

if [[ "${started}" -eq '0' ]]; then
    echo >&2 'Error. Cachet initialization failed.'
    exit 1
fi

echo 'Cachet has started!'
