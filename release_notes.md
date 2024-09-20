These are scripts for building GCC

* as a cross-compiler from macOS to arm-eabi or riscv64-elf,
* on macOS Sonoma (14, Darwin 23) but compatible with Monterey,
* for Apple silicon (M1),
* with Command Line Utilities 15.3.0 and Python 3.9.13,

Other software included:

* binutils-2.43.1 for arm-eabi, binutils-2.43.1-xh3irq for riscv64-elf
* newlib-4.4.0.20231231
* gdb-14.2

Tested with:

* `arm-eabi`, the Cortex-M3 as found on the [Arduino Due][ARDUINO], the Cortex-M4 as found on the [STMicroelectronics][STM] STM32F4 Discovery and STM32F429I Discovery boards and the Cortex-M0 as found in the nRF51 used in the [BBC micro:bit][BBC]; but note that GCC has implemented multilib support for other ARM chips.
* `riscv64-elf`, the Espressif [ESP32-H2][ESP32-H2], the RaspberryPi [Pico 2 with RP2350][Pico 2 with RP2350].

The compiler comes with no Ada Runtime System (RTS). See the [FreeRTOS Ada project][FREERTOS-Ada] for candidates (it needs to be built with `RELEASE=gcc12`).

The compiler is built with
```
--build=$BUILD
--target=$TARGET
--disable-libada
--disable-libcc1
--disable-libcilkrts
--disable-libffi
--disable-libgomp
--disable-libmudflap
--disable-libquadmath
--disable-libsanitizer
--disable-libssp
--disable-libstdcxx-pch
--disable-lto
--disable-nls
--disable-shared
--disable-threads
--disable-tls
--enable-languages="c,c++,ada"
--prefix=$PREFIX
--with-gnu-as
--with-gnu-ld
--with-libgloss
--with-newlib
--with-system-zlib
--without-libiconv-prefix
--enable-host-pie
$MULTILIB_SWITCH
```

where

* `$BUILD` is `aarch64-apple-darwin21`.
* `$TARGET` is `arm-eabi` or `riscv64-elf`.
* `$PREFIX` is part of the build process, to avoid installing untested builds on top of a working compiler.
* `$MULTILIB_SWITCH` setting is
  * for `arm-eabi`, `--with-multilib-list=rmprofile`, which supports Cortex-M0, Cortex-M0+, Cortex-M3, Cortex-M4, Cortex-M7, Cortex-M23, Cortex-M33, Cortex-R4, Cortex-R5, Cortex-R7, Cortex-R8 and Cortex-R52.
  * for `riscv64-elf`, `--enable-multilib`.

Notes
=====

The software was built using the [building-gcc-macos-cross][BUILDING] scripts at Github, tag gcc-14.2.0-1-aarch64.

Binutils 2.43.1
---------------

The RP2350 Risc-V cores support additional external interrupts using an extension "Xh3irq", which uses new CSRs (`meiea`, `meipa`, `meifa`, `meipra`, `meinext`, `meicontext`). For the `riscv64-elf` compiler, these have been patched so that they can be used in machine code insertions.

Building GDB
------------

A minor Python-related patch was required:
```
--- gdb/python/python-config.py~	2023-02-02 04:45:52
+++ gdb/python/python-config.py	2024-05-18 17:01:05
@@ -77,6 +77,4 @@
                     libs.insert(0, "-L" + getvar("LIBPL"))
                 elif os.name == "nt":
                     libs.insert(0, "-L" + os.path.normpath(sys.prefix) + "/libs")
-            if getvar("LINKFORSHARED") is not None:
-                libs.extend(getvar("LINKFORSHARED").split())
         print(to_unix_path(" ".join(libs)))
```
The reason is that the `LINKFORSHARED` Python configuration variable is broken on Darwin; this fix effectively detects that we're running on Darwin and doesn't use it. See e.g. [GDB PR29070].

GDB requires GMP and MPFR, which used to be available with the host compiler build at the same version. Now, to avoid problems with runpaths when the native compiler or the built GDB is relocated, we make static builds of the packages whose source was used to build the compiler, and we build `gdb` with `clang`.

[ARDUINO]: http://www.arduino.com
[STM]: http://www.st.com
[BBC]: http://microbit.org
[ESP32-H2]: https://www.espressif.com/sites/default/files/documentation/esp32-h2_datasheet_en.pdf
[Pico 2 with RP2350]: https://www.raspberrypi.com/products/raspberry-pi-pico-2/
[FREERTOS-ADA]: https://github.com/simonjwright/freertos-ada
[BUILDING]: https://github.com/simonjwright/building-gcc-macos-arm-eabi
[GDB PR29070]: https://sourceware.org/bugzilla/show_bug.cgi?id=29070
