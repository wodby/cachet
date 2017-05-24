#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

if ! [ -e "${APP_ROOT}/server.php" ]; then
    echo >&2 "Cachet not found in ${APP_ROOT} - copying now..."
    rsync -rlt "/usr/src/cachet/" "${APP_ROOT}/"
    echo >&2 "Complete! Cachet has been successfully copied to ${APP_ROOT}"
fi
