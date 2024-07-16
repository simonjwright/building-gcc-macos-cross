set -eu

script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

$GCC_SRC/configure                              \
    --build=$BUILD                              \
    --target=$TARGET                            \
    --disable-decimal-float                     \
    --disable-libada                            \
    --disable-libcc1                            \
    --disable-libcilkrts                        \
    --disable-libffi                            \
    --disable-libgomp                           \
    --disable-libmudflap                        \
    --disable-libquadmath                       \
    --disable-libsanitizer                      \
    --disable-libssp                            \
    --disable-libstdcxx-pch                     \
    --disable-lto                               \
    --disable-nls                               \
    --disable-nls                               \
    --disable-shared                            \
    --disable-threads                           \
    --disable-tls                               \
    --enable-languages="c"                      \
    --prefix=$PREFIX                            \
    --with-gnu-as                               \
    --with-gnu-ld                               \
    --with-libgloss                             \
    --with-newlib                               \
    --with-system-zlib                          \
    --without-headers                           \
    --without-libiconv-prefix                   \
    --enable-host-pie                           \
    $MULTILIB_SWITCH

make -w -j$CORES all-gcc

make -w install-gcc
