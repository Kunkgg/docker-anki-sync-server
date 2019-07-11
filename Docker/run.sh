#!/bin/sh
export DOCKER_USER=root
export ANKI_SYNC_DATA_DIR=/etc/anki-sync-server
export HOST_PORT=27701

mkdir -p "$ANKI_SYNC_DATA_DIR"
chown "$DOCKER_USER" "$ANKI_SYNC_DATA_DIR"
chmod 700 "$ANKI_SYNC_DATA_DIR"

docker run -itd \
   --mount type=bind,source="$ANKI_SYNC_DATA_DIR",target=/app/data \
   -p "$HOST_PORT":27701 \
   --name anki-sync \
   --restart always \
   kunka/anki-sync-server:latest \
   python -m ankisyncd
