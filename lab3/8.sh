#!/bin/bash

LC_VARS=$(env | grep '^LC_' | cut -d= -f2 | sort -u)

COUNT=$(echo "$LC_VARS" | wc -l)

if [ "$COUNT" -le 1 ]; then
  echo "OK: LC_* variables have same value"
else
  echo "Eror: LC_* variables have different values:"
  env | grep '^LC_'
  exit 1
fi
