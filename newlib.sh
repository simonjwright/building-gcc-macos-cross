set -eu

script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

PATH=$PREFIX/bin:$PATH

$NEWLIB_SRC/configure                           \
    --build=$BUILD                              \
    --target=$TARGET                            \
    --prefix=$PREFIX                            \
    --enable-newlib-io-long-long                \
    --enable-newlib-register-fini               \
    --disable-nls                               \
    --disable-newlib-supplied-syscalls

make CFLAGS_FOR_TARGET='-g -O2 -ffunction-sections -fdata-sections'     \
     -w                                                                 \
     -j$CORES                                                           \
     all

make -w install
