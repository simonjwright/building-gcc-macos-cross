script_loc=`cd $(dirname $0) && pwd -P`

. $script_loc/common.sh

$GCC_PATH/configure                                     \
 --build=$BUILD                                         \
 --disable-libada                                       \
 --disable-libcc1                                       \
 --disable-libcilkrts                                   \
 --disable-libmudflap                                   \
 --disable-libsanitizer                                 \
 --disable-libssp                                       \
 --disable-nls                                          \
 --disable-shared                                       \
 --disable-lto                                          \
 --enable-languages="c"                                 \
 --enable-multilib                                      \
 --prefix=$PREFIX                                       \
 --target=arm-eabi                                      \
 --with-bugurl=URL:mailto:simon@pushface.org            \
 --with-gnu-as                                          \
 --with-gnu-ld                                          \
 --with-libgloss                                        \
 --with-newlib                                          \
 --with-stage1-ldflags=-Wl,-headerpad_max_install_names \
 --with-system-zlib                                     \
 --without-headers                                      \
 --without-libiconv-prefix                              \
 $MULTILIB_LIST

make -w -j2

make -w all-gcc

make -w install

make install-gcc prefix=$HOME/local-arm
