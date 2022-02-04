## e-minus-docker-chain

Docker support for e- and beebasm - helps you to compile your e- programs from any platform using Wine.

1. Runs the e- compiler, created by 0xC0DE6502, to create 6502 assembly.
2. Runs beebasm to compile that 6502 assembly into an executable in a disk image.

With thanks to:

* [scottyhardy](https://github.com/scottyhardy), for [docker-wine](https://github.com/scottyhardy/docker-wine)
* [wineHQ](https://www.winehq.org/), for [Wine](https://www.winehq.org/)
* [0xC0DE6502](https://github.com/0xC0DE6502), for [e-_releases](https://github.com/0xC0DE6502/e-_releases)
* [stardot](https://github.com/stardot/beebasm), for [beebasm](https://github.com/stardot/beebasm)

## Prerequisites

* git (available by default on OS X)
* [Docker](https://www.docker.com/) ([Docker Desktop](https://www.docker.com/products/docker-desktop) is best for OS X)

## Getting started

Clone and initialise, with:

```bash
git clone https://github.com/instantiator/e-minus-docker-chain.git
cd e-minus-docker-chain
./init.sh
```

* Fetches the [docker-wine](https://raw.githubusercontent.com/scottyhardy/docker-wine/master/docker-wine) script
* Creates the `tools` directory
* Clones the [e-_releases](https://github.com/0xC0DE6502/e-_releases) and [beebasm](https://github.com/stardot/beebasm) repositories into `tools`

## Compiling some e-

This script requires that you specify a few directories. The syntax is:

```bash
./run-compilation.sh <e-release> <repo-directory> <relative-working-directory> <source-filename>
```

* `<e-release>` indicates the e- release to use - named by folder in the [0xC0DE6502/e-_releases](https://github.com/0xC0DE6502/e-_releases) repository eg. `v0.6a`
* `<repo-directory>` is the source root directory for the compilation
* `<relative-working-directory>` is the location to be in to start compilation, relative to the repo-directory
* `<source-filename>` - the source filename to compile

`<repo-directory>` is mounted inside the docker image, so it needs to encompass all the source code and libraries that will be used for compilation.

The compiler itself is invoked from within `<relative-working-directory>`. In this way, code that has relative paths in it (eg. the inclusion of system libraries from within `python.h.e-`) can still find what it's looking for.

The compiler executables (`e-.exe` and `beebasm.exe`) are found in the tools directory.

eg. to compile the python sample game:

```bash
./run-compilation.sh v0.6a tools/e-_releases/v0.6a python python.e-
```

## Output

* `e-.exe` creates an assembly file with the suffix `.6502`
* `beebasm.exe` creates a disk image with the suffix `.ssd`

## Testing

* Test your SSD with jsbeeb at: https://bbc.godbolt.org/
