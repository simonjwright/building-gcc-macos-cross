set -eu

script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

rm -rf *

$GCC_SRC/gmp/configure                          \
  --prefix=$PREFIX                              \
  --host=$BUILD                                 \
  --target=$BUILD                               \
  --build=$BUILD                                \
  --enable-cxx                                  \
  --disable-shared                               \
  M4=gm4

make -w -j$CORES

make install
