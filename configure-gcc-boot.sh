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
 --enable-languages="c"                                 \
 --enable-multilib                                      \
 --prefix=$HOME/local-arm                               \
 --target=arm-eabi                                      \
 --with-arch=armv7-m                                    \
 --with-mode=thumb                                      \
 --with-bugurl=URL:mailto:simon@pushface.org            \
 --with-gnu-as                                          \
 --with-gnu-ld                                          \
 --with-libgloss                                        \
 --with-newlib                                          \
 --with-stage1-ldflags=-Wl,-headerpad_max_install_names \
 --with-system-zlib                                     \
 --without-headers                                      \
 --without-libiconv-prefix

make -w -j2 all-gcc

make -w install-gcc
