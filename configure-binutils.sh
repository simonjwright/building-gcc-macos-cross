../../binutils-2.24/configure                   \
 --build=x86_64-apple-darwin13                  \
 --target=arm-none-eabi                         \
 --prefix=$HOME/local-arm                       \
 --enable-interwork                             \
 --with-gnu-as                                  \
 --with-gnu-ld                                  \
 --disable-nls                                  \
 --disable-werror

make

make install
