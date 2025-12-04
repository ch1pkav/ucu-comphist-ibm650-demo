# UCU Computer history course IBM 650 demo

This repo is a consolidation of materials gathered for the 2025 Fall Semester Computer History course project. It contains scripts to setup a demo of the [Open SIMH](https://github.com/open-simh/simh)-based [IBM 650](https://en.wikipedia.org/wiki/IBM_650) emulator, as well as options for demonstrating its functionality. A brief presentation on the topic can be found under `pres/` 

## Prerequisites
All the functionality requires a UNIX-like system with `bash` and `git` installed. Clone this repository to get started.

### Setup script
CLI tools used by the script:
- `wget`
- `make`
- `unzip`
- `gcc`

### Open SIMH
The compilation step requires the following libraries:
- `libm`
- `librt`
- `libpthread`
- `libdl`
- `libpng`
- `zlib`
- `mman`

## Setup
In the base directory of this repository:
```bash
./scripts/setup.sh
```

SIMH i650 source code, software for the emulator and scripts are located in the `resources/` directory. 

## Usage
List available demo examples:
```bash
./scripts/run.sh
```
Run example:
```bash
./scripts/run.sh <example-name>
```
Some built-in examples drop you into the emulator after execution. Type `exit` to terminate.

Additional usage information can be found in the [official docs](https://opensimh.org/simdocs/i650_doc).
