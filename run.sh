#!/bin/bash

GRHOME=~/grsat

if [ ! -d "$GRHOME" ]; then
    mkdir -p "$GRHOME"
fi

docker run \
    --rm \
    --tmpfs /tmp \
    -v "$GRHOME":/home/grsat \
    -it knegge/gr-satellites:v5.1.1 "$@"

