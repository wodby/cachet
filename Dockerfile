FROM wodby/php:7.1-3.6.1

ARG CACHET_VER

ENV APP_NAME="Cachet" \
    CACHET_VER="${CACHET_VER}"

USER root

RUN set -ex; \
    \
    mkdir -p /usr/src/cachet; \
    wget -qO- "https://github.com/CachetHQ/Cachet/archive/v${CACHET_VER}.tar.gz" \
        | tar xz --strip-components=1 -C /usr/src/cachet; \
    chown -R www-data:www-data /usr/src/cachet; \
    \
    mv /usr/local/bin/actions.mk /usr/local/bin/php.mk; \
    \
    su-exec www-data composer install -d /usr/src/cachet --no-dev -o; \
    su-exec www-data composer clear-cache

USER www-data

COPY templates /etc/gotpl/
COPY actions /usr/local/bin/
COPY init /docker-entrypoint-init.d/