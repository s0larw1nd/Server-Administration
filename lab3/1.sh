#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "$0 [file] [seconds]"
  exit 1
fi

OUTPUT_FILE="$1"
DURATION="$2"

if ! [[ "$DURATION" =~ ^[0-9]+$ ]]; then
  echo "Error: incorrect argument"
  exit 2
fi

for ((i=0; i<DURATION; i++)); do
  TIMESTAMP=$(date '+[%d.%m.%y] %H:%M')
  LOADAVG=$(cat /proc/loadavg)
  echo "$TIMESTAMP = $LOADAVG" >> "$OUTPUT_FILE"
  sleep 1
done
