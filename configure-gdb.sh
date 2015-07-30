../../../gdb-7.9-gpl-2015-src/configure         \
 --build=x86_64-apple-darwin13                  \
 --target=arm-eabi                              \
 --prefix=/usr/local/gnat                       \
 --with-arch=armv7-m                            \
 --with-mode=thumb                              \
 --enable-multilib                              \
 --disable-werror

make all -j4

cd gdb
make install prefix=$HOME/local-arm
