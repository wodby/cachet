#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

chown www-data:www-data "${APP_ROOT}"
su-exec www-data make init -f /usr/local/bin/actions.mk
