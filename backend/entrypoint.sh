#!/bin/sh

python3 manage.py collectstatic --noinput
python3 manage.py migrate --noinput
python3 -m gunicorn core.wsgi --bind 0.0.0:8000 --workers 3 --reload --timeout 120