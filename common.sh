# This contains variable declarations for the components to be used
# for this build. Some may be as distributed as part of GCC ARM
# Embedded in Launchpad (https://launchpad.net/gcc-arm-embedded)

# I didn't use their GMP (6.1.0), MPFR (3.1.4), MPC (1.0.3) as my GCC
# source tree already had these versions installed via
# contrib/download_prerequisites.

VERSION=${VERSION:=14.1.0}
BUILD=$ARCH-apple-darwin21

PYTHON=python3.9
CORES=$(sysctl -n hw.ncpu)

TOP=/Volumes/Miscellaneous3

PATH=$TOP/$ARCH/gcc-$VERSION-$ARCH/bin:$PATH
# This is the place where the native suite is built.

# This is where the build is built to: there aren't any .dylibs, so it
# can be just picked up and moved to its destination.
PREFIX=$TOP/arm/gcc-$VERSION-$ARCH

SRC_PATH=$TOP/src

# GCC_SRC=$SRC_PATH/gcc-darwin-arm64
# iains' WIP

#  GCC_SRC=$SRC_PATH/gcc-14-20240218
# that's the latest snapshot

# the default version
GCC_SRC=${GCC_SRC:-$SRC_PATH/gcc-$VERSION}

NEW_PATH=$PREFIX/bin:$PATH

BINUTILS_SRC=$SRC_PATH/binutils-2.42
NEWLIB_SRC=$SRC_PATH/newlib-4.4.0.20231231
GDB_SRC=$SRC_PATH/gdb-14.2

# This is present in GCC 7; it says
#                                            It should not be used in
# conjunction with another make file fragment and assumes --with-arch,
# --with-cpu, --with-fpu, --with-float, --with-mode have their default
# values during the configure step.
MULTILIB_LIST="--with-multilib-list=rmprofile"
