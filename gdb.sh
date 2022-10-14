set -eu

script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

PATH=$PREFIX/bin:$PATH

$GDB_PATH/configure                             \
 --build=$BUILD                                 \
 --target=arm-eabi                              \
 --prefix=$PREFIX                               \
 --with-python=python3                          \
 --disable-werror

make -w all -j3

cd gdb
make install
