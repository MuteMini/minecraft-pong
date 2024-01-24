# Learn GHDL and GTKWave

All rights to the VHDL files within this directory go to the contributers of the GHDL wiki. The most up-to-date version can be found here: [https://ghdl.github.io/ghdl/quick_start/simulation/index.html](https://ghdl.github.io/ghdl/quick_start/simulation/index.html).

## Windows Installation

Go download [Msys2](https://www.msys2.org/), a Windows package manager. Install [mingw32](https://packages.msys2.org/base/mingw-w64-gcc) (if you don't already have it), [GHDL](https://packages.msys2.org/base/mingw-w64-ghdl), and [GTKwave](https://packages.msys2.org/base/mingw-w64-gtkwave) using pacman. By default, on Windows, you should be downloading the `ucrt64` binary types.

Once all packages are downloaded, by default they will not be added to your PATH environment variable. Go find your Msys2 installation directory. Once you do, add the `[MSYS2_PATH]/ucrt64/bin` in your system PATH varible. Now, `gcc, ghdl, gtkwave` commands will all be available from the command terminal.

## Learning Steps

You can find the steps to take to learn basic usage of GHDL and GTKwave [here](https://ghdl.github.io/ghdl/quick_start/simulation/index.html).
All files as of version 4.0.0-dev of the documentation can be found in this directory. Open a terminal within this directory to run all the examples.
