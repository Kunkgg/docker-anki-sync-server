FROM library/python:3.7.0-alpine3.8

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add build-base && \
    apk add portaudio-dev  && \
    apk add sqlite
RUN echo "[global] \
trusted-host=mirrors.aliyun.com \
index-url=http://mirrors.aliyun.com/pypi/simple" > /etc/pip.conf 
RUN pip install webob

COPY anki-sync-server /app/anki-sync-server

WORKDIR /app/anki-sync-server

RUN \
    cd anki-bundled && \
    pip install -r requirements.txt && \
    mkdir /app/data && \
    cd /app/anki-sync-server

EXPOSE 27701

