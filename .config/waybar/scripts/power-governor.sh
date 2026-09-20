#!/bin/bash

GOVERNOR=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
BOOST=$(cat /sys/devices/system/cpu/cpufreq/boost)

if [ "$GOVERNOR" == "performance" ]; then
    ICON_INDEX="0"
elif [ "$GOVERNOR" == "balanced" ]; then
    ICON_INDEX="1"
elif [ "$GOVERNOR" == "powersave" ]; then
    ICON_INDEX="2"
else
    ICON_INDEX="3"
fi

echo "{\"text\":\"$TEMPERATURE\",\"alt\":\"$ICON_INDEX\",\"class\":\"$GOVERNOR-$BOOST\"}"
