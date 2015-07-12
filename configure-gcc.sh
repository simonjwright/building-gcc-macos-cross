../../../gcc-5.1.0/configure                            \
 --build=x86_64-apple-darwin13                          \
 --disable-libada                                       \
 --disable-libcc1                                       \
 --disable-libcilkrts                                   \
 --disable-libmudflap                                   \
 --disable-libsanitizer                                 \
 --disable-libssp                                       \
 --disable-nls                                          \
 --disable-shared                                       \
 --disable-lto                                          \
 --enable-languages="c,c++,ada"                         \
 --enable-multilib                                      \
 --prefix=$HOME/local-arm                               \
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
 --without-libiconv-prefix

make -w -j2

make -w -C gcc cross-gnattools ada.all.cross

make -w install
