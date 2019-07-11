#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd "$DIR"
git clone https://github.com/Kunkgg/anki-sync-server.git
cd anki-sync-server
git submodule update --init
cd ..
docker build -t anki-sync-server:tsudoku-2.1.4 .
