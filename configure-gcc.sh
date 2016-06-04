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
 --with-arch=armv7                                      \
 --with-mode=thumb                                      \
 --with-bugurl=URL:mailto:simon@pushface.org            \
 --with-gnu-as                                          \
 --with-gnu-ld                                          \
 --with-libgloss                                        \
 --with-newlib                                          \
 --with-stage1-ldflags=-Wl,-headerpad_max_install_names \
 --with-system-zlib                                     \
 --without-libiconv-prefix                              \
 $MULTILIB_LIST

make -w -j2

make -w -C gcc cross-gnattools ada.all.cross

make -w install

exit

This is the configuration setup for the Linux arm-eabi version
(sorted, for convenience).

../src/configure \
--build=i686-pc-linux-gnu
--disable-libada \
--disable-libssp \
--disable-libstdcxx-pch \
--disable-nls \
--enable-checking=release \
--enable-languages=ada,c \
--enable-multilib \
--prefix=/beuvry.a/gnatmail/sandbox/gpl-2016/arm-elf-linux/gcc/pkg \
--target=arm-eabi \
--with-arch=armv7 \
--with-bugurl=URL:mailto:report@adacore.com \
--with-gnu-as \
--with-gnu-ld \
--without-libiconv-prefix \
