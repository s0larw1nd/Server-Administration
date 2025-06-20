#!/bin/bash

OUTPUT_FILE="logs.log"
LOG_DIR="/var/log"

> "$OUTPUT_FILE"

for file in "$LOG_DIR"/*.log; do
  if [ -f "$file" ]; then
    LAST_LINE=$(tail -n 1 "$file")
    echo "$file: $LAST_LINE" >> "$OUTPUT_FILE"
  fi
done
