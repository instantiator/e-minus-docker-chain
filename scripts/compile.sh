#!/bin/bash

WORKING_PATH=$1
FILENAME=$2

pushd /home/src
pushd $WORKING_PATH
wine /home/tools/e-_releases/v0.6a/e-.exe -O -v -i $FILENAME -o $FILENAME.6502
popd
popd
