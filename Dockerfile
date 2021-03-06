ARG BASE_IMAGE_TAG

FROM wodby/php:${BASE_IMAGE_TAG}

ARG CACHET_VER

ENV APP_NAME="Cachet" \
    CACHET_VER="${CACHET_VER}" \
    PHP_ERROR_REPORTING="E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED" \
    PHP_FPM_CLEAR_ENV="no"

USER root

RUN set -ex; \
    \
    mkdir -p /usr/src/cachet; \
    cachet_url="https://github.com/CachetHQ/Cachet/archive/v${CACHET_VER}.tar.gz"; \
    wget -qO- "${cachet_url}" | tar xz --strip-components=1 -C /usr/src/cachet; \
    chown -R wodby:wodby /usr/src/cachet; \
    cd /usr/src/cachet/; \
    touch .env; \
    chown -R wodby:www-data \
        .env \
        bootstrap/cache \
        bootstrap/cachet \
        storage; \
    chmod -R 775 \
        .env \
        bootstrap/cache \
        bootstrap/cachet \
        storage; \
    \
    echo "$(cat /etc/sudoers.d/wodby), /usr/local/bin/init" > /etc/sudoers.d/wodby; \
    \
    mv /usr/local/bin/actions.mk /usr/local/bin/php.mk; \
    \
    su-exec wodby composer install -d /usr/src/cachet --no-dev -o; \
    su-exec wodby composer clear-cache

USER wodby

COPY bin /usr/local/bin/
COPY init /docker-entrypoint-init.d/