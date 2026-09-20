#!/bin/bash

STATE=$(systemctl --user is-active sunsetr.service)

if [ -z "$1" ]; then
    if [ $STATE = "active" ]; then
        echo "{\"alt\":\"enabled\"}"
    else
        echo "{\"alt\":\"disabled\"}"
    fi
    exit 0
fi

case "$1" in
"disable")
    systemctl --user stop sunsetr.service
    echo "{\"alt\":\"disabled\"}"
    ;;
"enable")
    systemctl --user start sunsetr.service
    echo "{\"alt\":\"enabled\"}"
    ;;
"toggle")
    if [ "$STATE" = "active" ]; then
        systemctl --user stop sunsetr.service
        echo "{\"alt\":\"disabled\"}"
    else
        systemctl --user start sunsetr.service
        echo "{\"alt\":\"enabled\"}"
    fi
    ;;
*)
    echo "Invalid argument: $1"
    exit 1
    ;;
esac
