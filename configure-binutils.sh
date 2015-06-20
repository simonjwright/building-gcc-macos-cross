../../binutils-2.24/configure                   \
 --build=x86_64-apple-darwin13                  \
 --target=arm-eabi                              \
 --prefix=/usr/local/gnat                       \
 --enable-multilib                              \
 --with-arch=armv7                              \
 --with-gnu-as                                  \
 --with-gnu-ld                                  \
 --disable-nls                                  \
 --disable-werror

make

make install prefix=$HOME/local-arm

exit

 --with-cpu=cortex-m4                           \
 --with-fpu=fpv4-sp-d16                         \
 --with-float=hard                              \
 --with-mode=thumb                              \
 --enable-interwork                             \
