#!/bin/bash
if [ ! -f ~/.volk/volk_config ]; then
    echo "Volk config not found, please run volk_profile"
fi

exec "$@"

