#!/bin/bash

curl -O https://raw.githubusercontent.com/scottyhardy/docker-wine/master/docker-wine
chmod +x docker-wine

mkdir -p tools

pushd tools
git clone https://github.com/0xC0DE6502/e-_releases.git
git clone https://github.com/stardot/beebasm.git
popd

