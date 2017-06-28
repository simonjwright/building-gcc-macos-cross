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
 --enable-languages="c,ada"                             \
 --enable-multilib                                      \
 --prefix=$PREFIX                                       \
 --target=arm-eabi                                      \
 --with-bugurl=URL:mailto:simon@pushface.org            \
 --with-gnu-as                                          \
 --with-gnu-ld                                          \
 --with-newlib                                          \
 --with-stage1-ldflags="$GCC_STAGE1_FLAGS"		\
 --with-system-zlib                                     \
 --without-libiconv-prefix                              \
 $MULTILIB_LIST

make -w -j3

make -w -j3 -C gcc cross-gnattools ada.all.cross

make -w install

exit
