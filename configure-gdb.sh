../../../gdb-7.7-gpl-2014-src/configure         \
 --build=x86_64-apple-darwin13                  \
 --target=arm-eabi                              \
 --prefix=$HOME/local-arm                       \
 --enable-interwork                             \
 --enable-multilib                              \
 --disable-werror

make all -j4

cd gdb
make install
