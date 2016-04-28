script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

$GDB_PATH/configure                             \
 --build=x86_64-apple-darwin15                  \
 --target=arm-eabi                              \
 --prefix=$HOME/local-arm                       \
 --disable-werror

make -w all -j2

cd gdb
make install
