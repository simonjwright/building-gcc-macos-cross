# This contains variable declarations for the components to be used
# for this build. Some are as distributed as part of GCC ARM Embedded
# in Launchpad (https://launchpad.net/gcc-arm-embedded)

# I didn't use their GMP (6.1.0), MPFR (3.1.4), MPC (1.0.3) as my GCC
# source tree already had these versions installed via
# contrib/download_prerequisites.

PATH=/opt/gnat-gpl-2017/bin:$PATH
TOP=/Volumes/Miscellaneous
PREFIX=$TOP/arm/gnat-gpl-2017
BUILD=x86_64-apple-darwin15

SRC_PATH=$TOP/tmp/2017
BINUTILS_PATH=$SRC_PATH/binutils-2.26.51s-gpl-2017-src
GCC_PATH=$SRC_PATH/gcc-6-gpl-2017-src
NEWLIB_PATH=$SRC_PATH/newlib-2.4-src
GDB_PATH=$SRC_PATH/gdb-7.10-gpl-2017-src

GCC_STAGE1_FLAGS="-lSystem -static-libstdc++ -static-libgcc -Wl,-headerpad_max_install_names"
MULTILIB_LIST="--with-arch=armv7"
