# Building `arm-eabi` #

This set of scripts supports building GCC Ada, or GNAT, on macOS as a cross-compiler for the arm-eabi target. It has been put together from various hints around the Web, and from painful experience.

The macOS-specific parts are:

* in `common.sh`, `BUILD=x86_64-apple-darwinNN`

The first prerequisite is to have a native Ada compiler, and its suitably-patched source code, for the GCC release you are building the cross-compiler for.

Next, you need the following sources (for the ones marked [G], the GNAT GPL sources contain appropriate versions for a GNAT GPL build; for an FSF GCC build, you should already have appropriate versions of the ones marked C via `contrib/download_prerequisites`):

* [C, G] the GNU Multiprecision library (`gmp`).

* [C, G] the GNU Multiple Precision Floating Point library (`mpfr`).

* [C, G] the GNU multiple precision complex number library (`mpc`).

* the GNU binary utilities (`binutils`).

* the embedded C library `newlib`.

* [G] the GNU debugger (`binutils-gdb`, or `gdb-M.N`).

These directions are written for macOS, using the default branch of the `building-gcc-macos-arm-eabi` Github repository (which is set up for the latest FSF GCC release), assumed hereafter to be in directory `$build`.

(1) Unpack all the sources.

(2) In `$build`, edit common.sh to reflect the locations. If you are happy to install over your native compiler, adjust `PREFIX` to suit (but that may require you to build with root privileges, not normally a good idea).

(4) At the top level of the GCC source directory, and if not already done, install the support libraries:

    contrib/download_prerequisites

(5) Ensure the native compiler is first on your `PATH`.

(6) Create a build directory, e.g. `~/tmp/build-arm`, and subdirectories `binutils/`, `gcc-boot/`, `newlib/`, `gcc/` and `gdb/`.

(7) In `binutils/`, call `$build/binutils.sh`.

(8) In `gcc-boot/`, call `$build/gcc-boot.sh`. This builds a C compiler capable of building newlib.

(9) If using a version of building-gcc-macos-arm-eabi earlier than 2016-05-07, set PATH so that the new $prefix/bin directory comes first, so that the new binutils will be used to build newlib. If using newer versions, this is done in the scripts.

(10) In `newlib/`, call `$build/newlib.sh`.

(11) In `gcc/`, call `$build/gcc.sh` (it's best not to do this in the `gcc-boot/` directory, at least if you don't wipe it first).

(12) In `gdb/`, call `$build/gdb.sh`.

The new compiler is now installed in `$prefix`.
