#I've applied the newlib-2.1.0 patch from https://github.com/istarc/stm32.git

../../newlib-2.1.0/configure                    \
 --build=x86_64-apple-darwin13                  \
 --target=arm-eabi                              \
 --prefix=$HOME/local-arm                       \
 --with-cpu=cortex-m4                           \
 --with-fpu=fpv4-sp-d16                         \
 --with-float=hard                              \
 --with-mode=thumb                              \
 --enable-interwork                             \
 --enable-multilib                              \
 --with-gnu-as                                  \
 --with-gnu-ld                                  \
 --disable-nls                                  \
 --disable-newlib-supplied-syscalls

make -j4 all

make install
