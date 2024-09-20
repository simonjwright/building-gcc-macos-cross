=# This contains variable declarations for the components to be used
# for this build.

# TARGET can be arm-eabi (default) or riscv-elf.

VERSION=${VERSION:=14.1.0}
BUILD=$ARCH-apple-darwin21
TARGET=${TARGET:=arm-eabi}

PYTHON=python3.9
CORES=$(sysctl -n hw.ncpu)

TOP=/Volumes/Miscellaneous3

PATH=$TOP/$ARCH/gcc-$VERSION-$ARCH/bin:$PATH
# This is the place where the native suite was built.

# This is where the build is built to: there aren't any .dylibs, so it
# can be just picked up and moved to its destination.
PREFIX=$TOP/$TARGET/gcc-$VERSION-$ARCH

SRC_PATH=$TOP/src

#---------------------------------------------------------------------
# GCC source; there are lots of compiler options.

# Building gcc-mirror
# GCC_SRC=$SRC_PATH/gcc

# Building gcc-13 for aarch64; the actual tag in that clone is
# gcc-13-3-darwin-r0 !!!
# GCC_SRC=$SRC_PATH/gcc-13-branch

# Building gcc-14 for aarch64; the actual tag in that clone is
# gcc-14.2-darwin-r1.
GCC_SRC=$SRC_PATH/gcc-14-branch

# Building iains's WIP for aarch64
# GCC_SRC=$SRC_PATH/gcc-darwin-arm64

# Building the latest FSF snapshot
# SNAPSHOT=20240407
# GCC_SRC=$SRC_PATH/gcc-14-$SNAPSHOT

# The default for an FSF releaase
GCC_SRC=${GCC_SRC:-$SRC_PATH/gcc-$VERSION}
#---------------------------------------------------------------------

NEW_PATH=$PREFIX/bin:$PATH

case $TARGET in
    arm-eabi)
        BINUTILS_SRC=$SRC_PATH/binutils-2.43.1
        ;;
    riscv*-elf)
        BINUTILS_SRC=$SRC_PATH/binutils-2.43.1-xh3irq
        ;;
esac

NEWLIB_SRC=$SRC_PATH/newlib-4.4.0.20231231
GDB_SRC=$SRC_PATH/gdb-14.2

case $TARGET in
    arm-eabi)
        # This is present in GCC 7; it says "It should not be
        # used in conjunction with another make file fragment
        # and assumes --with-arch, --with-cpu, --with-fpu,
        # --with-float, --with-mode have their default values
        # during the configure step."
        MULTILIB_SWITCH="--with-multilib-list=rmprofile"
        ;;
    riscv*-elf)
        MULTILIB_SWITCH="--enable-multilib"
        ;;
esac

