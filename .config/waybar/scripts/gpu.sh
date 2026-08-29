#!/bin/bash

if ! command -v nvidia-smi &> /dev/null; then
    echo ""
    exit 1
fi

USAGE=$(printf "%0*d" 3 $(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits))

echo "{\"text\":\"$USAGE\"}"
