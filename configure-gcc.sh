script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

$GCC_PATH/configure                                                      \
 --build=x86_64-apple-darwin15                                           \
 --disable-libada                                                        \
 --disable-libcc1                                                        \
 --disable-libcilkrts                                                    \
 --disable-libffi                                                        \
 --disable-libgomp                                                       \
 --disable-libmudflap                                                    \
 --disable-libquadmath                                                   \
 --disable-libsanitizer                                                  \
 --disable-libssp                                                        \
 --disable-libstdcxx-pch                                                 \
 --disable-lto                                                           \
 --disable-nls                                                           \
 --disable-shared                                                        \
 --disable-threads                                                       \
 --disable-tls                                                           \
 --enable-languages="c,c++,ada"                                          \
 --prefix=$HOME/local-arm                                                \
 --target=arm-eabi                                                       \
 --with-gnu-as                                                           \
 --with-gnu-ld                                                           \
 --with-libgloss                                                         \
 --with-newlib                                                           \
 --with-stage1-ldflags='-Wl,-headerpad_max_install_names -shared-libgcc' \
 --with-system-zlib                                                      \
 --without-libiconv-prefix                                               \
 $MULTILIB_LIST

make -w -j2

make -w -C gcc cross-gnattools ada.all.cross

make -w install
