# This contains variable declarations for the components to be used
# for this build. Some may be as distributed as part of GCC ARM
# Embedded in Launchpad (https://launchpad.net/gcc-arm-embedded)

# I didn't use their GMP (6.1.0), MPFR (3.1.4), MPC (1.0.3) as my GCC
# source tree already had these versions installed via
# contrib/download_prerequisites.

VERSION=13.1.0
PATH=/opt/gcc-$VERSION/bin:$PATH
TOP=/Volumes/Miscellaneous3
PREFIX=$TOP/arm/gcc-$VERSION
BUILD=x86_64-apple-darwin21

SRC_PATH=$TOP/src
BINUTILS_PATH=$SRC_PATH/binutils-2.40
GCC_PATH=$SRC_PATH/gcc-$VERSION
NEWLIB_PATH=$SRC_PATH/newlib-4.3.0.20230120
GDB_PATH=$SRC_PATH/binutils-gdb

# This is present in GCC 7; it says
#                                            It should not be used in
# conjunction with another make file fragment and assumes --with-arch,
# --with-cpu, --with-fpu, --with-float, --with-mode have their default
# values during the configure step.
MULTILIB_LIST="--with-multilib-list=rmprofile"
