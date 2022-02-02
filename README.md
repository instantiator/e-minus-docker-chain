## e-minus-docker-chain

Runs the e- compiler under docker.

With thanks to:

* [scottyhardy](https://github.com/scottyhardy), for [docker-wine](https://github.com/scottyhardy/docker-wine)
* [0xC0DE6502](https://github.com/0xC0DE6502), for [e-_releases](https://github.com/0xC0DE6502/e-_releases)
* [stardot](https://github.com/stardot/beebasm), for [beebasm](https://github.com/stardot/beebasm)

## Usage

First, initialise:

```
./init.sh
```

This script requires that you specify a few directories. The syntax is:

```
./run-compilation.sh <repo-directory> <relative-working-directory> <source-filename>
```

* `<repo-directory>` - the directory at the root of all sources for the compilation (including `e-.exe` and the `lib` directory provided by the e- release)
* `<relative-working-directory>` - relative to the repo-directory, the location to be in to start compilation
* `<source-filename>` - the source filename to compile

eg.

```
./run-compilation.sh tools/e-_releases/v0.6a python python.e-
```
