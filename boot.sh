#!/bin/sh
poetry shell
flask db upgrade
exec gunicorn -b :5000 --access-logfile - --error-logfile - microblog:app