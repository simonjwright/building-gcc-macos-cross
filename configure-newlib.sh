#I've applied the newlib-2.1.0 patch from https://github.com/istarc/stm32.git

../../newlib-2.1.0/configure                    \
 --build=x86_64-apple-darwin13                  \
 --target=arm-eabi                              \
 --prefix=/usr/local/gnat                       \
 --with-arch=armv7                              \
 --with-mode=thumb                              \
 --enable-multilib                              \
 --with-gnu-as                                  \
 --with-gnu-ld                                  \
 --disable-nls                                  \
 --disable-newlib-supplied-syscalls

make -j4 all

make install prefix=$HOME/local-arm

exit
