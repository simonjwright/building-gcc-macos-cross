../../../gcc-4.9.1/configure                    \
 --build=x86_64-apple-darwin13                  \
 --target=arm-eabi                              \
 --prefix=$HOME/local-arm                       \
 --with-cpu=cortex-m4                           \
 --with-fpu=fpv4-sp-d16                         \
 --with-float=hard                              \
 --with-mode=thumb                              \
 --enable-interwork                             \
 --enable-multilib                              \
 --enable-languages="c,c++,ada"                 \
 --with-system-zlib                             \
 --with-newlib                                  \
 --with-libgloss                                \
 --disable-shared                               \
 --disable-libada                               \
 --disable-nls                                  \
 --with-gnu-as                                  \
 --with-gnu-ld                                  \
 --with-stage1-libs=no                          \
 --with-stage1-ldflags=no                       \
 --with-boot-libs=no                            \
 --with-boot-ldflags=no                         \
 --with-bugurl=URL:mailto:simon@pushface.org

make -j4

make -C gcc cross-gnattools ada.all.cross

make install
