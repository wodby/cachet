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

| Variable          | Default Value      | Description |
| ----------------- | ------------------ | ----------- |
| `APP_ENV`         | `development`      |             |
| `APP_DEBUG`       | `false`            |             |
| `APP_URL`         | `http://localhost` |             |
| `DB_DRIVER`       | `pgsql`            |             |
| `DB_HOST`         | `postgres`         |             |
| `DB_UNIX_SOCKET`  | `null`             |             |
| `DB_DATABASE`     | `cachet`           |             |
| `DB_USERNAME`     |                    |             |
| `DB_PASSWORD`     |                    |             |
| `DB_PORT`         | `5432`             |             |
| `DB_PREFIX`       |                    |             |
| `CACHE_DRIVER`    | `apc`              |             |
| `SESSION_DRIVER`  | `apc`              |             |
| `QUEUE_DRIVER`    | `database`         |             |
| `BEACON`          | `true`             |             |
| `EMOJI`           | `false`            |             |
| `AUTO_TWITTER`    | `true`             |             |
| `MAIL_DRIVER`     | `smtp`             |             |
| `MAIL_HOST`       | `null`             |             |
| `MAIL_PORT`       | `25`               |             |
| `MAIL_USERNAME`   | `null`             |             |
| `MAIL_PASSWORD`   | `null`             |             |
| `MAIL_ADDRESS`    | `null`             |             |
| `MAIL_NAME`       | `null`             |             |
| `MAIL_ENCRYPTION` | `null`             |             |
| `REDIS_HOST`      | `null`             |             |
| `REDIS_DATABASE`  | `cachet`           |             |
| `REDIS_PORT`      | `6379`             |             |
| `GITHUB_TOKEN`    | `null`             |             |
| `NEXMO_KEY`       | `null`             |             |
| `NEXMO_SECRET`    | `null`             |             |
| `NEXMO_SMS_FROM`  | `Cachet`           |             |

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
