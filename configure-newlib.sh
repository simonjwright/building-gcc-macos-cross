script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

PATH=$PREFIX/bin:$PATH

$NEWLIB_PATH/configure                          \
 --build=$BUILD                                 \
 --target=arm-eabi                              \
 --prefix=$PREFIX                               \
 --enable-newlib-io-long-long                   \
 --enable-newlib-register-fini                  \
 --disable-nls                                  \
 --disable-newlib-supplied-syscalls

# Building for GNAT GPL 2017, GCC 6.3.1, we get armv6 capability but
# for some reason building libgloss fails. So we just need
# target-newlib.

make -w -j3 \
    CFLAGS_FOR_TARGET='-g -O2 -ffunction-sections -fdata-sections' \
    all-target-newlib

make -w install-target-newlib
