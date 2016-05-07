# This contains variable declarations for the components to be used
# for this build. Most are as distributed as part of GCC ARM Embedded
# in Launchpad (https://launchpad.net/gcc-arm-embedded)

# I didn't use their GMP, MPFR, MPC as I have used later versions
# successfully.

PREFIX=$HOME/local-arm

SRC_PATH=$HOME/tmp/gcc-arm-none-eabi-5_2-2015q4-20151219/src
BINUTILS_PATH=$SRC_PATH/binutils
GCC_PATH=$HOME/tmp/gcc-6.1.0
NEWLIB_PATH=$SRC_PATH/newlib
GDB_PATH=$SRC_PATH/gdb

MULTILIB_LIST="--with-arch=armv7 --with-mode=thumb"
