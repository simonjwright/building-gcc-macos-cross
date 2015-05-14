../../../gcc-5.1.0/configure                            \
 --prefix=$HOME/local-arm                               \
 --target=arm-none-eabi                                 \
 --build=x86_64-apple-darwin13                          \
 --disable-decimal-float                                \
 --disable-libffi                                       \
 --disable-libgomp                                      \
 --disable-libmudflap                                   \
 --disable-libquadmath                                  \
 --disable-libssp                                       \
 --disable-libstdcxx-pch                                \
 --disable-nls                                          \
 --disable-shared                                       \
 --disable-ssp                                          \
 --disable-threads                                      \
 --disable-tls                                          \
 --enable-interwork                                     \
 --enable-languages="c"                                 \
 --enable-multilib                                      \
 --with-multilib-list=armv6-m,armv7-m,armv7e-m,armv7-r  \
 --with-newlib                                          \
 --without-headers                                      \
 --with-gnu-as                                          \
 --with-gnu-ld                                          \
 --with-stage1-ldflags=no                               \
 --with-stage1-libs=no                                  \
 --with-boot-ldflags=no                                 \
 --with-boot-libs=no                                    \
 --with-bugurl=URL:mailto:simon@pushface.org

make -j4 all-gcc

make install-gcc
