script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

$GCC_PATH/configure                             \
 --build=x86_64-apple-darwin15                  \
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
 --prefix=$HOME/local-arm                       \
 --target=arm-eabi                              \
 --with-gnu-as                                  \
 --with-gnu-ld                                  \
 --with-libgloss                                \
 --with-newlib                                  \
 --with-system-zlib                             \
 --without-headers                              \
 --without-libiconv-prefix                      \
 $MULTILIB_LIST

make -w -j2 all-gcc

make -w install-gcc
