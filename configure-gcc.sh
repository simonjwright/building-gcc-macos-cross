../../../gcc-5.1.0/configure                                    \
 --build=x86_64-apple-darwin13                                  \
 --target=arm-none-eabi                                         \
 --prefix=$HOME/local-arm                                       \
 --disable-decimal-float                                        \
 --disable-libada                                               \
 --disable-libffi                                               \
 --disable-libgomp                                              \
 --disable-libmudflap                                           \
 --disable-libquadmath                                          \
 --disable-libssp                                               \
 --disable-libstdcxx-pch                                        \
 --disable-nls                                                  \
 --disable-shared                                               \
 --disable-ssp                                                  \
 --disable-threads                                              \
 --disable-tls                                                  \
 --enable-interwork                                             \
 --enable-languages="c,c++,ada"                                 \
 --enable-multilib                                              \
 "--with-multilib-list=armv6-m,armv7-m,armv7e-m,armv7-r"        \
 --with-newlib                                                  \
 --with-headers                                                 \
 --with-system-zlib                                             \
 --with-gnu-as                                                  \
 --with-gnu-ld                                                  \
 --with-stage1-libs=no                                          \
 --with-stage1-ldflags=no                                       \
 --with-boot-libs=no                                            \
 --with-boot-ldflags=no                                         \
 --with-bugurl=URL:mailto:simon@pushface.org

make -j4

make -C gcc cross-gnattools ada.all.cross

make install
