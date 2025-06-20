#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "$0 [file1] [file2] ..."
  exit 1
fi

for file in "$@"; do
  if [ -f "$file" ]; then
    COUNT=$(wc -l < "$file")
    echo "$file: $COUNT lines"
  else
    echo "Error: incorrect file '$file'"
  fi
done
