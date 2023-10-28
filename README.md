# Cachet Docker Container Image

[![Build Status](https://github.com/wodby/cachet/workflows/Build%20docker%20image/badge.svg)](https://github.com/wodby/cachet/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/cachet.svg)](https://hub.docker.com/r/wodby/cachet)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/cachet.svg)](https://hub.docker.com/r/wodby/cachet)
[![Docker Layers](https://images.microbadger.com/badges/image/wodby/cachet.svg)](https://microbadger.com/images/wodby/cachet)

## Docker Images

❗For better reliability we release images with stability tags (`wodby/cachet:2.4-X.X.X`) which correspond to [git tags](https://github.com/wodby/cachet/releases). We strongly recommend using images only with stability tags. 

Overview:

- All images based on Alpine Linux
- Base image: [wodby/php](https://github.com/wodby/php)
- [GitHub actions builds](https://github.com/wodby/cachet/actions) 
- [Docker Hub](https://hub.docker.com/r/wodby/cachet)

Supported tags and respective `Dockerfile` links:

- `2.4`, `2`, `latest` [_(Dockerfile)_](https://github.com/wodby/cachet/tree/master/Dockerfile)

## Environment Variables

See `env.example` in [CachetHQ repository](https://github.com/CachetHQ/Cachet) for all Cachet environment variables.

| Variable              | Default Value                                   | Description |
| -----------------     | ------------------                              | ----------- |
| `PHP_ERROR_REPORTING` | `E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED` |             |
| `PHP_FPM_CLEAR_ENV`   | `no`                                            |             |

See [wodby/php](https://github.com/wodby/php) for all image variables

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
