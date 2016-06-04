script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

$GDB_PATH/configure                             \
 --build=$BUILD                                 \
 --target=arm-eabi                              \
 --prefix=$PREFIX                               \
 --disable-werror

make all -j4

cd gdb
make install
