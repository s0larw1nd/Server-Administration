#!/bin/bash

declare -A MOONS=(
  ["mercury"]=0
  ["venus"]=0
  ["earth"]=1
  ["mars"]=2
  ["jupiter"]=98
  ["saturn"]=83
  ["uranus"]=27
  ["neptune"]=14
)

if [ "$#" -ne 1 ]; then
  echo "$0 [planet]"
  exit 1
fi

PLANET=$(echo "$1" | tr '[:upper:]' '[:lower:]')

if [[ -v MOONS["$PLANET"] ]]; then
  echo "${MOONS[$PLANET]}"
else
  echo "Unknown planet"
  exit 2
fi
