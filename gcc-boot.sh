set -eu

script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

$GCC_PATH/configure                             \
 --build=$BUILD                                 \
 --disable-decimal-float                        \
 --disable-libada                               \
 --disable-libcc1                               \
 --disable-libcilkrts                           \
 --disable-libffi                               \
 --disable-libgomp                              \
 --disable-libmudflap                           \
 --disable-libquadmath                          \
 --disable-libsanitizer                         \
 --disable-libssp                               \
 --disable-libstdcxx-pch                        \
 --disable-lto                                  \
 --disable-nls                                  \
 --disable-nls                                  \
 --disable-shared                               \
 --disable-threads                              \
 --disable-tls                                  \
 --enable-languages="c"                         \
 --prefix=$PREFIX                               \
 --target=arm-eabi                              \
 --with-gnu-as                                  \
 --with-gnu-ld                                  \
 --with-libgloss                                \
 --with-newlib                                  \
 --with-system-zlib                             \
 --without-headers                              \
 --without-libiconv-prefix                      \
 --enable-host-pie                              \
 $MULTILIB_LIST

make -w -j7 all-gcc

make -w install-gcc
