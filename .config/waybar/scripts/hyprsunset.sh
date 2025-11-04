#!/bin/bash

if [ -z "$1" ]; then
    if pgrep -x hyprsunset >/dev/null; then
        echo "{\"alt\":\"enabled\"}"
    else
        echo "{\"alt\":\"disabled\"}"
    fi
    exit 0
fi

case "$1" in
"disable")
    hyprsunset --identity >/dev/null 2>&1
    pkill hyprsunset >/dev/null 2>&1
    echo "{\"alt\":\"disabled\"}"
    ;;
"enable")
    if ! pgrep -x hyprsunset >/dev/null; then
        nohup hyprsunset >/dev/null 2>&1 &
        disown
    fi
    echo "{\"alt\":\"enabled\"}"
    ;;
"toggle")
    if pgrep -x hyprsunset >/dev/null; then
        hyprsunset --identity >/dev/null 2>&1
        pkill hyprsunset >/dev/null 2>&1
        echo "{\"alt\":\"disabled\"}"
    else
        if ! pgrep -x hyprsunset >/dev/null; then
            nohup hyprsunset >/dev/null 2>&1 &
            disown
        fi
        echo "{\"alt\":\"enabled\"}"
    fi
    ;;
*)
    echo "Invalid argument: $1"
    exit 1
    ;;
esac
