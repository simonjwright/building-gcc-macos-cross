script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

$GCC_PATH/configure                                     \
 --build=$BUILD                                         \
 --disable-libada                                       \
 --disable-libcc1                                       \
 --disable-libcilkrts                                   \
 --disable-libffi                                       \
 --disable-libgomp                                      \
 --disable-libmudflap                                   \
 --disable-libquadmath                                  \
 --disable-libsanitizer                                 \
 --disable-libssp                                       \
 --disable-libstdcxx-pch                                \
 --disable-lto                                          \
 --disable-nls                                          \
 --disable-shared                                       \
 --disable-threads                                      \
 --disable-tls                                          \
 --enable-languages="c,c++,ada"                         \
 --prefix=$PREFIX                                       \
 --target=arm-eabi                                      \
 --with-gnu-as                                          \
 --with-gnu-ld                                          \
 --with-libgloss                                        \
 --with-newlib                                          \
 --with-stage1-ldflags="$GCC_STAGE1_LDFLAGS"            \
 --with-system-zlib                                     \
 --without-libiconv-prefix                              \
 $MULTILIB_LIST

make -w -j3

make -w -C gcc cross-gnattools ada.all.cross

make -w install
