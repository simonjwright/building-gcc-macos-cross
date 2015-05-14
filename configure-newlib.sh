#I've applied the newlib-2.1.0 patch from https://github.com/istarc/stm32.git

../../newlib-2.1.0/configure                            \
 --build=x86_64-apple-darwin13                          \
 --target=arm-none-eabi                                 \
 --prefix=$HOME/local-arm                               \
 --enable-interwork                                     \
 --enable-multilib                                      \
 --with-multilib-list=armv6-m,armv7-m,armv7e-m,armv7-r  \
 --enable-newlib-register-fini                          \
 --with-gnu-as                                          \
 --with-gnu-ld                                          \
 --disable-nls                                          \
 --disable-newlib-supplied-syscalls

make -j4 all

make install
