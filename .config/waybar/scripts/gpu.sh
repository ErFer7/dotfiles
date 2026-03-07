#!/bin/bash

USAGE=$(printf "%0*d" 3 $(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits))

echo "{\"text\":\"$USAGE\"}"
