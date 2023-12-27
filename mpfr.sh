set -eu

script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

rm -rf *

$GCC_PATH/mpfr/configure                         \
  --prefix=$PREFIX                              \
  --host=$BUILD                                 \
  --target=$BUILD                               \
  --build=$BUILD                                \
  --disable-shared

make -w -j7

make install
