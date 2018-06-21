# Cachet Docker Container Image

[![Build Status](https://travis-ci.org/wodby/cachet.svg?branch=master)](https://travis-ci.org/wodby/cachet)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/cachet.svg)](https://hub.docker.com/r/wodby/cachet)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/cachet.svg)](https://hub.docker.com/r/wodby/cachet)
[![Docker Layers](https://images.microbadger.com/badges/image/wodby/cachet.svg)](https://microbadger.com/images/wodby/cachet)

## Docker Images

❗For better reliability we release images with stability tags (`wodby/cachet:2.3-X.X.X`) which correspond to [git tags](https://github.com/wodby/cachet/releases). We strongly recommend using images only with stability tags. 

Overview:

* All images are based on Alpine Linux
* Base image: [wodby/php](https://github.com/wodby/php)
* [TravisCI builds](https://travis-ci.org/wodby/cachet) 
* [Docker Hub](https://hub.docker.com/r/wodby/cachet)

Supported tags and respective `Dockerfile` links:

* `2.3`, `2`, `latest` [_(Dockerfile)_](https://github.com/wodby/cachet/tree/master/Dockerfile)

## Environment Variables

| Variable                 | Default Value      | Description |
| -----------------------  | ------------------ | ----------- |
| `CACHET_APP_ENV`         | `development`      |             |
| `CACHET_APP_DEBUG`       | `false`            |             |
| `CACHET_APP_URL`         | `http://localhost` |             |
| `CACHET_DB_DRIVER`       | `pgsql`            |             |
| `CACHET_DB_HOST`         |                    |             |
| `CACHET_DB_UNIX_SOCKET`  | `null`             |             |
| `CACHET_DB_DATABASE`     |                    |             |
| `CACHET_DB_USERNAME`     |                    |             |
| `CACHET_DB_PASSWORD`     |                    |             |
| `CACHET_DB_PORT`         | `5432`             |             |
| `CACHET_DB_PREFIX`       |                    |             |
| `CACHET_CACHE_DRIVER`    | `apc`              |             |
| `CACHET_SESSION_DRIVER`  | `apc`              |             |
| `CACHET_QUEUE_DRIVER`    | `database`         |             |
| `CACHET_BEACON`          | `true`             |             |
| `CACHET_EMOJI`           | `false`            |             |
| `CACHET_AUTO_TWITTER`    | `true`             |             |
| `CACHET_MAIL_DRIVER`     | `smtp`             |             |
| `CACHET_MAIL_HOST`       | `localhost`        |             |
| `CACHET_MAIL_PORT`       | `25`               |             |
| `CACHET_MAIL_USERNAME`   | `null`             |             |
| `CACHET_MAIL_PASSWORD`   | `null`             |             |
| `CACHET_MAIL_ADDRESS`    | `null`             |             |
| `CACHET_MAIL_NAME`       | `null`             |             |
| `CACHET_MAIL_ENCRYPTION` | `null`             |             |
| `CACHET_REDIS_HOST`      | `null`             |             |
| `CACHET_REDIS_DATABASE`  | `cachet`           |             |
| `CACHET_REDIS_PORT`      | `6379`             |             |
| `CACHET_GITHUB_TOKEN`    | `null`             |             |
| `CACHET_NEXMO_KEY`       | `null`             |             |
| `CACHET_NEXMO_SECRET`    | `null`             |             |
| `CACHET_NEXMO_SMS_FROM`  | `Cachet`           |             |

See [wodby/php](https://github.com/wodby/php) for all variables

## Orchestration Actions

Usage:
```
make COMMAND [params ...]
 
commands:
    init
```

See [wodby/php](https://github.com/wodby/php) for all actions

## Deployment

Deploy Cachet to your own server via [![Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://wodby.com).
