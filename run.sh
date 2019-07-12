#!/bin/sh
export ANKI_SYNC_DATA_DIR=$HOME/ankisync-data
export HOST_PORT=27701

if [ -d "$ANKI_SYNC_DATA_DIR" ]; then
    echo "Anki sync data directory exists"
else
    echo "Creating Anki sync data directory: $ANKI_SYNC_DATA_DIR"
    mkdir -p "$ANKI_SYNC_DATA_DIR"
fi
chown "$USER" "$ANKI_SYNC_DATA_DIR"
chmod 700 "$ANKI_SYNC_DATA_DIR"

docker run -itd \
   --mount type=bind,source="$ANKI_SYNC_DATA_DIR",target=/app/data \
   -p "$HOST_PORT":27701 \
   --name anki-sync \
   --restart always \
   kunka/anki-sync-server:latest
echo "============================== \
Anki sync created success \
data directory: $ANKI_SYNC_DATA_DIR
server linsten port: $HOST_PORT "
