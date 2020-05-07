#! /usr/bin/env sh
set -e


DEFAULT_GUNICORN_CONF=/gunicorn_conf.py

export GUNICORN_CONF=${GUNICORN_CONF:-$DEFAULT_GUNICORN_CONF}

PRE_START_PATH=${PRE_START_PATH:-/prestart.sh}
echo "Checking for script in $PRE_START_PATH"
if [ -f $PRE_START_PATH ] ; then
    echo "Running script $PRE_START_PATH"
    . "$PRE_START_PATH"
else
    echo "There is no script $PRE_START_PATH"
fi


# Start Gunicorn
exec gunicorn -c "$GUNICORN_CONF" "config.wsgi" --reload
