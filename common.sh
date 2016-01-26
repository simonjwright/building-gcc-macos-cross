# This contains variable declarations for the components distributed
# as part GCC ARM Embedded in Launchpad
# (https://launchpad.net/gcc-arm-embedded)

# I didn't use their GMP, MPFR, MPC as I have used later versions
# successfully.

SRC_PATH=$HOME/tmp/gcc-arm-none-eabi-5_2-2015q4-20151219/src
BINUTILS_PATH=$SRC_PATH/binutils
GCC_PATH=$SRC_PATH/gcc
NEWLIB_PATH=$SRC_PATH/newlib
GDB_PATH=$SRC_PATH/gdb

MULTILIB_LIST="--with-multilib-list=armv6-m,armv7-m,armv7e-m,armv7-r,armv8-m.base,armv8-m.main"
