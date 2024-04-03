# VHDL Design fo Minecraft Pong

## Setup Development Environment

To have the same development environment as the contributers of this repo, VSCode is recommended.

Install the following VSCode Extensions:
- [VHDL Syntax Highlighter](https://marketplace.visualstudio.com/items?itemName=rjyoung.vscode-modern-vhdl-support)
- [VHDL LS](https://marketplace.visualstudio.com/items?itemName=hbohlin.vhdl-ls)

You will also require GHDL and GTKWave to analyze the VHDL code in the way the main contributers have.

### Learn GHDL and GTKWave

All rights to the VHDL files within the `./learn` directory go to the contributers of the GHDL wiki. All files as of version 4.0.0-dev of the documentation can be found in it. Open a terminal within this directory to run all the examples.The most up-to-date version can be found here: [https://ghdl.github.io/ghdl/quick_start/simulation/index.html](https://ghdl.github.io/ghdl/quick_start/simulation/index.html). 

### Windows Installation

Go download [MSYS2](https://www.msys2.org/), a Windows package manager and follow the installation instructions. Install [mingw32](https://packages.msys2.org/base/mingw-w64-gcc) (if you don't already have it), [GHDL](https://packages.msys2.org/base/mingw-w64-ghdl), and [GTKwave](https://packages.msys2.org/base/mingw-w64-gtkwave) using pacman. To do so, enter the command: `pacman -S <binary_package_name>` into the MSYS2 UCRT64 terminal. By default, on Windows, you should be downloading the `ucrt64` binary types.

Once all packages are downloaded, by default they will not be added to your PATH environment variable. Go find your Msys2 installation directory. Once you do, add the `[MSYS2_PATH]/ucrt64/bin` in your system PATH varible which is accessed through SYSTEM ENVIRONMENT VARIABLES. Now, `gcc, ghdl, gtkwave` commands will all be available from the command terminal.

## Important Commands

Run the following commands from the `./vhdl` directory. As per GHDL default, we will be using VHDL-1993 standard.

```
-- Analyze VHDL code and move binaries into ./work
ghdl -a --workdir=work [FILE NAMES, supports glob]

-- Elaborate and run binaries in ./work
ghdl --elab-run --workdir=work [ENTITY NAME]

-- Make sure if you write some optional configurations into analysis, you run the same configuration in the elaboration and run step.

-- Remove all files except executaable in work directory
ghdl --remove --workdir=work
```
