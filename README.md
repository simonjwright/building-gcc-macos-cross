# Building a cross-compiler #

This set of scripts supports building GCC Ada, or GNAT, on macOS as a cross-compiler for the arm-eabi or riscv64-elf target. It has been put together from various hints around the Web, and from painful experience.

The first prerequisite is to have a native Ada compiler, and its suitably-patched source code, for the GCC release you are building the cross-compiler for.

Next, you need the following sources (for an FSF GCC build, you should already have appropriate versions of the ones marked C, installed with the native compiler sources via `contrib/download_prerequisites`):

* [C] the GNU Multiprecision library (`gmp`).

* [C] the GNU Multiple Precision Floating Point library (`mpfr`).

* [C] the GNU multiple precision complex number library (`mpc`).

* the GNU binary utilities (`binutils`).

* the embedded C library `newlib`.

* the GNU debugger (`binutils-gdb`, or `gdb-M.N`).

These directions are written for macOS, using the default branch of the `building-gcc-macos-cross` Github repository (which is set up for the latest FSF GCC release), assumed hereafter to be in directory `$builder`.

1. Unpack all the sources.

1. In `$builder`, edit common.sh to reflect the locations. If you are happy to install over your native compiler, adjust `PREFIX` to suit (but that may require you to build with root privileges, not normally a good idea).

1. Ensure the native compiler is first on your `PATH`. The default assumes that you're building for Apple silicon (`aarch64`) with an `aarch64` compiler. If you want to build for Intel silicon (`x86_64`), you must be using an `x86_64` compiler and running in an `x86_64` shell; start such a shell by `arch -x86_64 /bin/bash`.

1. Create a build directory, e.g. `~/tmp/build-arm`.

1. In this directory, call `make -f $builder/Makefile <options>`. There are several options: the main ones are
   * VERSION. The default is `14.1.0`, but you could set it to e.g. `14.1.0-1`.
   * TARGET. The options are
       * `arm-eabi` (default)
       * `riscv*-elf` (preferably `riscv64-elf`: `*` can be blank, `32`, or `64`; all result in basically the same compiler, but `64` is usual.

The new compiler is now installed in `$PREFIX` (see `common.sh`).
