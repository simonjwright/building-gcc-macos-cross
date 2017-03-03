# This contains variable declarations for the components to be used
# for this build. Some are as distributed as part of GCC ARM Embedded
# in Launchpad (https://launchpad.net/gcc-arm-embedded)

# I didn't use their GMP, MPFR, MPC as AdaCore's versions match the
# ones I've been using (gmp-5.1.3, mpc-1.0.2, mpfr-3.1.2).

BUILD=x86_64-apple-darwin15
PREFIX=$HOME/local-arm

ARM_EMBEDDED_PATH=$HOME/tmp/gcc-arm-none-eabi-5_2-2015q4-20151219/src
GNAT_PATH=$HOME/tmp/gnat-gpl-2016

BINUTILS_PATH=$ARM_EMBEDDED_PATH/binutils
GCC_PATH=$GNAT_PATH/gcc-4.9-gpl-2016-src
NEWLIB_PATH=$ARM_EMBEDDED_PATH/newlib
GDB_PATH=$GNAT_PATH/gdb-7.10-gpl-2016-src

MULTILIB_LIST="--with-arch=armv7"
