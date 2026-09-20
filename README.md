# Cachet Docker Container Image

[![Build Status](https://github.com/wodby/cachet/workflows/Build%20docker%20image/badge.svg)](https://github.com/wodby/cachet/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/cachet.svg)](https://hub.docker.com/r/wodby/cachet)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/cachet.svg)](https://hub.docker.com/r/wodby/cachet)
[![Docker Layers](https://images.microbadger.com/badges/image/wodby/cachet.svg)](https://microbadger.com/images/wodby/cachet)

## Docker Images

Use image revision tags such as `wodby/cachet:2.4-rN` to select a Wodby image revision.
Major and minor tags use the repository release number. Full-version tags such as
`wodby/cachet:2.4.1-r0` start at `r0` for each exact upstream version.
Every published versioned revision tag has a matching annotated Git tag pointing to its release commit.
Existing tags remain available after support for their major or minor version ends.
See [release tags](https://github.com/wodby/cachet/tags) for available revisions and the [image revision policy](https://github.com/wodby/images#image-revisions) for upgrade guidance.
Existing SemVer image tags remain available.

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
