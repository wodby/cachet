#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

checkDBConnection() {
    echo "Checking database connection..."
    case "${DB_DRIVER}" in
        mysql)
            prog="mysqladmin -h ${DB_HOST} -u ${DB_USERNAME} ${DB_PASSWORD:+-p$DB_PASSWORD} -P ${DB_PORT} status"
            ;;
        pgsql)
            prog="/usr/bin/pg_isready"
            prog="${prog} -h ${DB_HOST} -U ${DB_USERNAME} -d ${DB_DATABASE} -t 1"
            ;;
    esac

    timeout=60
    while ! "${prog}" > /dev/null 2>&1
    do
        timeout=$(( $timeout - 1 ))
        if [[ "${timeout}" -eq 0 ]]; then
            echo
            echo "Could not connect to database server! Aborting..."
            exit 1
        fi
        echo -n "."
        sleep 1
    done
    echo "OK"
}

checkDBInitMySQL() {
    table=sessions
    if [[ "$(mysql -N -s -h "${DB_HOST}" -u "${DB_USERNAME}" "${DB_PASSWORD:+-p$DB_PASSWORD}" "${DB_DATABASE}" -P "${DB_PORT}" -e \
        "select count(*) from information_schema.tables where \
            table_schema='${DB_DATABASE}' and table_name='${DB_PREFIX}${table}';")" -eq 1 ]]; then
        echo "Table ${DB_PREFIX}${table} exists! ..."
    else
        echo "Table ${DB_PREFIX}${table} does not exist! ..."
        InitDB
    fi
}

checkDBInitPostgres() {
    table=sessions
    if [[ "$(PGPASSWORD="${DB_PASSWORD}" psql -h "${DB_HOST}" -U "${DB_USERNAME}" -d "${DB_DATABASE}" -c "SELECT to_regclass('${DB_PREFIX}${table}');" | grep -c "${DB_PREFIX}${table}")" -eq 1 ]]; then
        echo "Table ${DB_PREFIX}${table} exists! ..."
    else
        echo "Table ${DB_PREFIX}${table} does not exist! ..."
        InitDB
    fi
}

checkConfigured() {
    case "${DB_DRIVER}" in
        mysql)
        checkDBInitMySQL
        ;;
        pgsql)
        checkDBInitPostgres
        ;;
    esac
}

InitDB() {
    echo "Initializing Cachet database ..."
    php artisan app:install
    checkConfigured
}

su-exec www-data make init -f /usr/local/bin/actions.mk

if [[ -n "${DB_DRIVER}" ]]; then
    su-exec www-data gotpl "/etc/gotpl/env.tpl" > "/var/www/html/.env"
    checkDBConnection
    checkConfigured
    echo "Starting Cachet..."
    php artisan config:cache
else
    echo "DB credentials missing, omit initialization."
fi
