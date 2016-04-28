script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

$BINUTILS_PATH/configure                        \
 --build=x86_64-apple-darwin15                  \
 --target=arm-eabi                              \
 --prefix=$PREFIX                               \
 --disable-nls                                  \
 --disable-werror                               \
 --enable-interwork

make -w -j2

make install
