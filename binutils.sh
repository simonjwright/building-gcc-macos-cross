set -eu

script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

$BINUTILS_SRC/configure                         \
 --build=$BUILD                                 \
 --target=$TARGET                               \
 --prefix=$PREFIX                               \
 --disable-nls                                  \
 --disable-werror                               \
 --enable-interwork                             \
 --without-zstd

make -w -j$CORES

make install
