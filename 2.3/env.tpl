APP_ENV={{ getenv "CACHET_APP_ENV" "production" }}
APP_DEBUG={{ getenv "CACHET_APP_DEBUG" "false" }}
APP_URL={{ getenv "CACHET_APP_URL" "http://localhost" }}
APP_KEY=

DB_DRIVER={{ getenv "CACHET_DB_DRIVER" "pgsql" }}
DB_HOST={{ getenv "CACHET_DB_HOST" }}
DB_UNIX_SOCKET={{ getenv "CACHET_DB_UNIX_SOCKET" "null" }}
DB_DATABASE={{ getenv "CACHET_DB_DATABASE" }}
DB_USERNAME={{ getenv "CACHET_DB_USERNAME" }}
DB_PASSWORD={{ getenv "CACHET_DB_PASSWORD" }}
DB_PORT={{ getenv "CACHET_DB_PORT" "5432" }}
DB_PREFIX={{ getenv "CACHET_DB_PREFIX" }}

CACHE_DRIVER={{ getenv "CACHET_CACHE_DRIVER" "apc" }}
SESSION_DRIVER={{ getenv "CACHET_SESSION_DRIVER" "apc" }}
QUEUE_DRIVER={{ getenv "CACHET_QUEUE_DRIVER" "database" }}

CACHET_BEACON={{ getenv "CACHET_BEACON" "true" }}
CACHET_EMOJI={{ getenv "CACHET_EMOJI" "false" }}
CACHET_AUTO_TWITTER={{ getenv "CACHET_AUTO_TWITTER" "true" }}

MAIL_DRIVER={{ getenv "CACHET_MAIL_DRIVER" "null" }}
MAIL_HOST={{ getenv "CACHET_MAIL_HOST" "null" }}
MAIL_PORT={{ getenv "CACHET_MAIL_PORT" "null" }}
MAIL_USERNAME={{ getenv "CACHET_MAIL_USERNAME" "null" }}
MAIL_PASSWORD={{ getenv "CACHET_MAIL_PASSWORD" "null" }}
MAIL_ADDRESS={{ getenv "CACHET_MAIL_ADDRESS" "null" }}
MAIL_NAME={{ getenv "CACHET_MAIL_NAME" "null" }}
MAIL_ENCRYPTION={{ getenv "CACHET_MAIL_ENCRYPTION" "tls" }}

REDIS_HOST={{ getenv "CACHET_REDIS_HOST" "null" }}
REDIS_DATABASE={{ getenv "CACHET_REDIS_DATABASE" "null" }}
REDIS_PORT={{ getenv "CACHET_REDIS_PORT" "null" }}

GITHUB_TOKEN={{ getenv "CACHET_GITHUB_TOKEN" "null" }}

NEXMO_KEY={{ getenv "CACHET_NEXMO_KEY" "null" }}
NEXMO_SECRET={{ getenv "CACHET_NEXMO_SECRET" "null" }}
NEXMO_SMS_FROM={{ getenv "CACHET_NEXMO_SMS_FROM" "Cachet" }}
