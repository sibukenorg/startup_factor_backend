FROM python:3.8.2-alpine

ENV PYTHONUNBUFFERED 1

RUN apk upgrade -U \
 && apk add --no-cache g++ gcc libffi-dev postgresql-dev jpeg-dev zlib-dev \
 && rm -rf /var/cache/*

COPY ./requirements/api/dev/ /config
RUN pip install --upgrade pip && pip install --no-cache-dir -r /config/requirements.txt

COPY ./docker_config/api/dev/start.sh /start.sh
RUN chmod +x /start.sh

COPY ./docker_config/api/dev/gunicorn_conf.py /gunicorn_conf.py
COPY ./docker_config/api/dev/prestart.sh /prestart.sh

COPY ./src /src

WORKDIR /src


ENV PYTHONPATH=/src

EXPOSE 80

CMD ["/start.sh"]