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

check_db_connection() {
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

check_db_init() {
    case "${CACHET_DB_DRIVER}" in
        mysql)
        check_db_init_mysql
        ;;
        pgsql)
        check_db_init_postgres
        ;;
    esac
}

check_db_init_mysql() {
    table=sessions
    if [[ "$(mysql -N -s -h "${host}" -u "${user}" "${pass}" "${db}" -e \
        "select count(*) from information_schema.tables where \
            table_schema='${db}' and table_name='${prefix}${table}';")" -eq 1 ]]; then
        echo "DB is already initialized..."
    else
        init_db
    fi
}

check_db_init_postgres() {
    table=sessions
    if [[ "$(PGPASSWORD="${pass}" psql -h "${host}" -U "${user}" -d "${db}" \
        -c "SELECT to_regclass('${prefix}${table}');" | grep -c "${prefix}${table}")" -eq 1 ]]; then
        echo "DB is already initialized..."
    else
        init_db
    fi
}

init_db() {
    echo "Initializing Cachet database ..."
    php artisan app:install
    php artisan config:cache
}

copy_cachet() {
    if [[ ! -f "${APP_ROOT}/server.php" ]]; then
        echo >&2 "Cachet not found in ${APP_ROOT} - copying now..."
        rsync -rplt "/usr/src/cachet/" "${APP_ROOT}/"
        echo >&2 "Complete! Cachet has been successfully copied to ${APP_ROOT}"
        rm -rf bootstrap/cache/*
        chmod -R 777 storage
    fi
}

copy_cachet

if [[ -n "${host}" ]]; then
    gotpl "/etc/gotpl/env.tpl" > "${APP_ROOT}/.env"
    check_db_connection
    check_db_init
else
    echo "DB credentials missing, omit initialization."
fi
