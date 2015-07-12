../../../gdb-7.9-gpl-2015-src/configure         \
 --build=x86_64-apple-darwin13                  \
 --target=arm-eabi                              \
 --prefix=$HOME/local-arm                       \
 --with-arch=armv7                              \
 --disable-werror

make -w all -j2

cd gdb
make install
