#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

host="${CACHET_DB_HOST}"
user="${CACHET_DB_USERNAME}"
pass="${CACHET_DB_PASSWORD}"
db="${CACHET_DB_DATABASE}"
prefix="${CACHET_DB_PREFIX}"

checkDBConnection() {
    echo "Checking database connection..."
    case "${CACHET_DB_DRIVER:=pgsql}" in
        mysql)
            cmd="mysqladmin -h ${host} -u ${user} ${pass} status"
            ;;
        pgsql)
            cmd="PGPASSWORD=${pass} psql -h ${host} -U ${user} -d ${db} -c \"SELECT 1\""
            ;;
    esac

    started=0
    max_try=12
    wait_seconds=5

    for i in $(seq 1 "${max_try}"); do
        if eval "${cmd}" &> /dev/null; then
            started=1
            break
        fi
        echo 'Waiting for DBMS startup...'
        sleep "${wait_seconds}"
    done

    if [[ "${started}" -eq '0' ]]; then
        echo >&2 'Error. DBMS is unreachable.'
        exit 1
    fi

    echo 'DBMS has started!'
}

checkDBInit() {
    case "${CACHET_DB_DRIVER}" in
        mysql)
        checkDBInitMySQL
        ;;
        pgsql)
        checkDBInitPostgres
        ;;
    esac
}

checkDBInitMySQL() {
    table=sessions
    if [[ "$(mysql -N -s -h "${host}" -u "${user}" "${pass}" "${db}" -e \
        "select count(*) from information_schema.tables where \
            table_schema='${db}' and table_name='${prefix}${table}';")" -eq 1 ]]; then
        echo "DB is already initialized..."
    else
        InitDB
    fi
}

checkDBInitPostgres() {
    table=sessions
    if [[ "$(PGPASSWORD="${pass}" psql -h "${host}" -U "${user}" -d "${db}" \
        -c "SELECT to_regclass('${prefix}${table}');" | grep -c "${prefix}${table}")" -eq 1 ]]; then
        echo "DB is already initialized..."
    else
        InitDB
    fi
}

InitDB() {
    echo "Initializing Cachet database ..."
    php artisan app:install
    php artisan config:cache
}

copyCachet() {
    if ! [ -e "${APP_ROOT}/server.php" ]; then
        echo >&2 "Cachet not found in ${APP_ROOT} - copying now..."
        rsync -rlt "/usr/src/cachet/" "${APP_ROOT}/"
        echo >&2 "Complete! Cachet has been successfully copied to ${APP_ROOT}"
        rm -rf bootstrap/cache/*
        chmod -R 777 storage
    fi
}

copyCachet

if [[ -n "${host}" ]]; then
    gotpl "/etc/gotpl/env.tpl" > "/var/www/html/.env"
    checkDBConnection
    checkDBInit
else
    echo "DB credentials missing, omit initialization."
fi
