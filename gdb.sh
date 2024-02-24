set -eu

script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

PATH=$NEW_PATH

$GDB_SRC/configure                             \
 --build=$BUILD                                 \
 --target=arm-eabi                              \
 --prefix=$PREFIX                               \
 --with-python=python3                          \
 --with-mpfr=$PREFIX                            \
 --without-zstd                                 \
 --disable-werror

 make -w all -j7

cd gdb
make install
