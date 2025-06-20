#!/bin/bash

if [ "$FOO" = "5" ] && [ "$BAR" = "1" ]; then
  echo "Execution prohibited: FOO=5 and BAR=1"
  exit 1
fi

echo "Waiting for file..."

initial_files=$(ls -1A)

while true; do
  current_files=$(ls -1A)
  for file in $current_files; do
    if ! echo "$initial_files" | grep -qx "$file"; then
      echo "New file detected: $file"
      exit 0
    fi
  done
  sleep 1
done
