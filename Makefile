# Makefile to build GCC/newlib/gdb for arm-eabi.
#
# The idea is to make each phase depend on the successful completion
# of the previous phase.

location := $(shell echo $(dir $(abspath $(lastword $(MAKEFILE_LIST)))) \
	| sed -e "s;/$$;;")

# what architecture are we running? (will get arm64 or i386)
current_arch = $(shell arch)

# what architecture was the compiler built for?
aarch64 = $(findstring aarch64, $(shell gcc -print-libgcc-file-name))
x86_64  = $(findstring x86_64,  $(shell gcc -print-libgcc-file-name))

# check that the compiler matches the architecture
ifeq ($(current_arch),arm64)
  ifeq ($(aarch64),)
    $(error shell is aarch64 but current gcc is not)
  else
    export ARCH=aarch64
  endif
else
  ifeq ($(current_arch),i386)
    ifeq ($(x86_64),)
      $(error shell is x86_64 but current gcc is not)
    else
      export ARCH=x86_64
    endif
  else
    $(error unexpected architecure $(current_arch), expecting i386)
  endif
endif

all: gcc gdb

binutils: binutils-stamp
.PHONY: binutils
binutils-stamp: $(location)/common.sh $(location)/binutils.sh
	rm -rf $@ binutils
	mkdir binutils
	(cd binutils; $(location)/binutils.sh) && touch $@

gcc-boot: gcc-boot-stamp
.PHONY: gcc-boot
gcc-boot-stamp: binutils-stamp $(location)/common.sh $(location)/gcc-boot.sh
	rm -rf $@ gcc-boot
	mkdir gcc-boot
	(cd gcc-boot; $(location)/gcc-boot.sh) && touch $@

newlib: newlib-stamp
.PHONY: newlib
newlib-stamp: gcc-boot-stamp $(location)/common.sh $(location)/newlib.sh
	rm -rf $@ newlib
	mkdir newlib
	(cd newlib; $(location)/newlib.sh) && touch $@

gcc: gcc-stamp
.PHONY: gcc
gcc-stamp: newlib-stamp $(location)/common.sh $(location)/gcc.sh
	rm -rf $@ gcc
	mkdir gcc
	(cd gcc; $(location)/gcc.sh) && touch $@

gmp: gmp-stamp
.PHONY: gmp
gmp-stamp: $(location)/common.sh $(location)/gmp.sh
	rm -rf $@ gmp
	mkdir gmp
	(cd gmp; $(location)/gmp.sh) && touch $@

mpfr: mpfr-stamp
.PHONY: mpfr
mpfr-stamp: gmp-stamp $(location)/common.sh $(location)/mpfr.sh
	rm -rf $@ mpfr
	mkdir mpfr
	(cd mpfr; $(location)/mpfr.sh) && touch $@

gdb: gdb-stamp
.PHONY: gdb
gdb-stamp: mpfr-stamp $(location)/common.sh $(location)/gdb.sh
	rm -rf $@ gdb
	mkdir gdb
	(cd gdb; $(location)/gdb.sh) && touch $@
