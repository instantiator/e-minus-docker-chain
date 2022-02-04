#!/bin/bash

set -e
set -o pipefail

E_RELEASE=$1
WORKING_PATH=$2
FILENAME=$3

pushd /home/src
pushd $WORKING_PATH

echo
echo ">>> Initiating compilation with e-"
wine /home/tools/e-_releases/$E_RELEASE/e-.exe -O -v -i $FILENAME -o $FILENAME.6502

echo
echo ">>> Initiating compilation with beebasm"
wine /home/tools/beebasm/beebasm.exe -w -v -i $FILENAME.6502 -o 0xC0DE -do $FILENAME.ssd -title PROGRAM -opt 3 > $FILENAME.listing.txt

popd
popd
