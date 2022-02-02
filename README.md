## e-minus-docker-chain

Docker support for e- and beebasm.

1. Runs the e- compiler, created by 0xC0DE6502, to create 6502 assembly.
2. Runs beebasm to compile that 6502 assembly into an executable in a disk image.

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

* `<repo-directory>` - the directory at the root of all sources for the compilation
* `<relative-working-directory>` - relative to the repo-directory, the location to be in to start compilation
* `<source-filename>` - the source filename to compile

NB. `<repo-directory>` is mounted inside the docker image that will do the work, and then the compiler itself is invoked from within `<relative-working-directory>`. In this way, code that has relative paths in it (eg. the inclusion of system libraries from within `python.h.e-`) can still find what it's looking for.

eg. to compile the python sample game:

```
./run-compilation.sh tools/e-_releases/v0.6a python python.e-
```

## Output

* `e-.exe` creates an assembly file with the suffix `.6502`
* `beebasm.exe` creates a disk image with the suffix `.ssd`

## Testing

* Test your SSD with jsbeeb at: https://bbc.godbolt.org/
