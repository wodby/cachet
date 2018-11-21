APP_ENV={{ getenv "APP_ENV" "development" }}
APP_DEBUG={{ getenv "APP_DEBUG" "false" }}
APP_URL={{ getenv "APP_URL" "http://localhost" }}
APP_KEY=

DB_DRIVER={{ getenv "DB_DRIVER" "pgsql" }}
DB_HOST={{ getenv "DB_HOST" "postgres" }}
DB_UNIX_SOCKET={{ getenv "DB_UNIX_SOCKET" "null" }}
DB_DATABASE={{ getenv "DB_DATABASE" "cachet" }}
DB_USERNAME={{ getenv "DB_USERNAME" }}
DB_PASSWORD={{ getenv "DB_PASSWORD" }}
DB_PORT={{ getenv "DB_PORT" "5432" }}
DB_PREFIX={{ getenv "DB_PREFIX" }}

CACHE_DRIVER={{ getenv "CACHE_DRIVER" "apc" }}
SESSION_DRIVER={{ getenv "SESSION_DRIVER" "apc" }}
QUEUE_DRIVER={{ getenv "QUEUE_DRIVER" "database" }}

BEACON={{ getenv "BEACON" "true" }}
EMOJI={{ getenv "EMOJI" "false" }}
AUTO_TWITTER={{ getenv "AUTO_TWITTER" "true" }}

MAIL_DRIVER={{ getenv "MAIL_DRIVER" "smtp" }}
MAIL_HOST={{ getenv "MAIL_HOST" "opensmtpd" }}
MAIL_PORT={{ getenv "MAIL_PORT" "25" }}
MAIL_USERNAME={{ getenv "MAIL_USERNAME" "null" }}
MAIL_PASSWORD={{ getenv "MAIL_PASSWORD" "null" }}
MAIL_ADDRESS={{ getenv "MAIL_ADDRESS" "null" }}
MAIL_NAME={{ getenv "MAIL_NAME" "null" }}
MAIL_ENCRYPTION={{ getenv "MAIL_ENCRYPTION" "null" }}

REDIS_HOST={{ getenv "REDIS_HOST" "null" }}
REDIS_DATABASE={{ getenv "REDIS_DATABASE" "cachet" }}
REDIS_PORT={{ getenv "REDIS_PORT" "6379" }}

GITHUB_TOKEN={{ getenv "GITHUB_TOKEN" "null" }}

NEXMO_KEY={{ getenv "NEXMO_KEY" "null" }}
NEXMO_SECRET={{ getenv "NEXMO_SECRET" "null" }}
NEXMO_SMS_FROM={{ getenv "NEXMO_SMS_FROM" "Cachet" }}
