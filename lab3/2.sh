#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "$0 [path to directory]"
  exit 1
fi

TARGET_DIR="$1"

if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: directory '$TARGET_DIR' does not exist"
  exit 2
fi

cd "$TARGET_DIR" || exit 3

for dir in */ ; do
  if [ -d "$dir" ]; then
    DIR_NAME="${dir%/}"
    ELEMENT_COUNT=$(find "$dir" -mindepth 1 -maxdepth 1 | wc -l)
    echo "$ELEMENT_COUNT" > "${DIR_NAME}.txt"
  fi
done
