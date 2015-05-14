../../../gdb-7.7-gpl-2014-src/configure                 \
 --build=x86_64-apple-darwin13                          \
 --target=arm-none-eabi                                 \
 --prefix=$HOME/local-arm                               \
 --enable-interwork                                     \
 --enable-multilib                                      \
 --with-multilib-list=armv6-m,armv7-m,armv7e-m,armv7-r  \
 --disable-werror

make all -j4

cd gdb
make install
