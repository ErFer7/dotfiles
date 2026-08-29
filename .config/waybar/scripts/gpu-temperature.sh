#!/bin/bash

RAW_TEMPERATURE=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)

TEMPERATURE=$(printf "%0*d" 2 "$RAW_TEMPERATURE")

if [ "$RAW_TEMPERATURE" -le 35 ]; then
    ICON_INDEX="0"
elif [ "$RAW_TEMPERATURE" -le 70 ]; then
    ICON_INDEX="1"
else
    ICON_INDEX="2"
fi

CLASS=""
if [ "$RAW_TEMPERATURE" -ge 80 ]; then
    CLASS="critical"
fi

echo "{\"text\":\"$TEMPERATURE\",\"alt\":\"$ICON_INDEX\",\"class\":\"$CLASS\"}"
