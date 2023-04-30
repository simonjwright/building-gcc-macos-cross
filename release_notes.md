This is GCC 13.1.0, rebuilt as a cross-compiler from macOS to arm-eabi, on Intel macOS Monterey (12, Darwin 21), with Command Line Tools 14.2 and Python 3.9.13.

Tested with the Cortex-M3 as found on the [Arduino Due][ARDUINO], the Cortex-M4 as found on the [STMicroelectronics][STM] STM32F4 Discovery and STM32F429I Discovery boards and the Cortex-M0 as found in the nRF51 used in the [BBC micro:bit][BBC]; but note that GCC has implemented multilib support for other ARM chips.

Other software included:

  * binutils-2.40
  * newlib-4.3.0
  * binutils-gdb at tag `gdb-12.1-release` with a [minor patch](#python-patch).

The compiler comes with no Ada Runtime System (RTS). See the [Cortex GNAT Run Time Systems project][CORTEX-GNAT-RTS] for candidates.

NOTE: Cortex GNAT RTS needs to be built with `RELEASE=gcc12`.

The compiler was built with
```
--build=x86_64-apple-darwin21
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
--enable-languages=c,c++,ada
--prefix=/Volumes/Miscellaneous3/arm/gcc-13.1.0
--target=arm-eabi
--with-gnu-as
--with-gnu-ld
--with-libgloss
--with-newlib
--with-system-zlib
--without-libiconv-prefix
--with-multilib-list=rmprofile
```

The `--prefix` setting was part of the build process, to avoid
installing untested builds on top of a working compiler.

The `--with-multilib-list` setting supports the following:

   Cortex-M0, Cortex-M0+, Cortex-M3, Cortex-M4, Cortex-M7,
   Cortex-M23, Cortex-M33, Cortex-R4, Cortex-R5, Cortex-R7, Cortex-R8
   and Cortex-R52.

## Install ##

One of _Xcode_ or the _Command Line Tools_ is required.

Download the binary `.pkg`. It's not signed, so **don't** double-click on it; instead, right-click on it and _Open_. Accept the warning. You will be guided through the installation.

Notes
=====
The software was built using the [building-gcc-macos-arm-eabi][BUILDING] scripts at Github, tag gcc-13.1.0.

The <a name="python-patch">minor Python-related patch</a> referred to above is
```
index 027d80dcc86..3b282d2f56d 100644
--- a/gdb/python/python-config.py
+++ b/gdb/python/python-config.py
@@ -77,6 +77,7 @@ for opt in opt_flags:
                     libs.insert(0, "-L" + getvar("LIBPL"))
                 elif os.name == "nt":
                     libs.insert(0, "-L" + sysconfig.PREFIX + "/libs")
-            if getvar("LINKFORSHARED") is not None:
+            if getvar("LINKFORSHARED") is not None \
+               and not getvar('PYTHONFRAMEWORK'):
                 libs.extend(getvar("LINKFORSHARED").split())
         print(to_unix_path(" ".join(libs)))
```
The reason is that the `LINKFORSHARED` Python configuration variable is broken on Darwin; this fix effectively detects that we're running on Darwin and doesn't use it.

[ARDUINO]: http://www.arduino.com
[STM]: http://www.st.com
[BBC]: http://microbit.org
[CORTEX-GNAT-RTS]: https://github.com/simonjwright/cortex-gnat-rts
[BUILDING]:https://github.com/simonjwright/building-gcc-macos-arm-eabi
