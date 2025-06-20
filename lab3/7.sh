#!/bin/bash

IFS=':' read -ra PATH_DIRS <<< "$PATH"

echo "PATH catalogues and their number of files:"
echo

for dir in "${PATH_DIRS[@]}"; do
  if [ -d "$dir" ]; then
    COUNT=$(find "$dir" -maxdepth 1 -type f 2>/dev/null | wc -l)
    echo "$dir: $COUNT files"
  else
    echo "$dir: error"
  fi
done
