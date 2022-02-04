#!/bin/bash

set -e
set -o pipefail

if [ "$#" -ne 4 ]; then
  echo "Usage: ./run-compilation.sh <e-release> <repo-directory> <relative-working-directory> <source-filename>"
  echo "   eg. ./run-compilation.sh v0.6a tools/e-_releases/v0.6a python python.e-"
  exit 1
fi

if [ ! -d "tools/" ]; then
  echo "tools directory not found. Please run init.sh to initialise."
  exit 1
fi

get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

E_RELEASE=$1
SRC_PATH=$(get_abs_filename $2)
WORKING_PATH=$3
FILENAME=$4

if [ ! -d "$SRC_PATH" ]; then
  echo "$SRC_PATH not found, or not a directory."
  exit 1
fi

if [ ! -f "$SRC_PATH/$WORKING_PATH/$FILENAME" ]; then
  echo "$FILENAME not found in: $SRC_PATH/$WORKING_PATH"
  exit 1
fi

# compile e- to 6502 assembler
./docker-wine \
  --name=e-minus \
  --volume=$(pwd)/tools:/home/tools \
  --volume=$(pwd)/scripts:/home/scripts \
  --volume=$SRC_PATH:/home/src \
  /home/scripts/compile.sh $E_RELEASE $WORKING_PATH $FILENAME
