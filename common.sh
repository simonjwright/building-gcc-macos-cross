# This contains variable declarations for the components to be used
# for this build. Some are as distributed as part of GCC ARM Embedded
# in Launchpad (https://launchpad.net/gcc-arm-embedded)

# I didn't use their GMP (6.1.0), MPFR (3.1.4), MPC (1.0.3) as my GCC
# source tree already had these versions installed via
# contrib/download_prerequisites.

PATH=/opt/gcc-7.1.0/bin:$PATH
TOP=/Volumes/Miscellaneous
PREFIX=$TOP/arm/gcc-7.1.0
BUILD=x86_64-apple-darwin15

SRC_PATH=$TOP/tmp/gcc-arm-none-eabi-6-2017-q1-update/src
BINUTILS_PATH=$SRC_PATH/binutils
GCC_PATH=$TOP/tmp/gcc-7.1.0
NEWLIB_PATH=$SRC_PATH/newlib

GDB_PATH=$TOP/tmp/gdb-7.10-gpl-2016-src

# This is present in GCC 7; it says
#                                            It should not be used in
# conjunction with another make file fragment and assumes --with-arch,
# --with-cpu, --with-fpu, --with-float, --with-mode have their default
# values during the configure step.
MULTILIB_LIST="--with-multilib-list=rmprofile"
