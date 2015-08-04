../../newlib-2.2.0/configure                    \
 --build=x86_64-apple-darwin13                  \
 --target=arm-eabi                              \
 --prefix=$HOME/local-arm                       \
 --with-arch=armv7                              \
 --with-mode=thumb                              \
 --disable-interwork                            \
 --enable-multilib                              \
 --with-gnu-as                                  \
 --with-gnu-ld                                  \
 --disable-nls                                  \
 --disable-newlib-supplied-syscalls

make -w -j2 all

make -w install
