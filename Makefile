# Makefile to build GCC/newlib/gdb for arm-eabi.
#
# The idea is to make each phase depend on the successful completion
# of the previous phase.

location := $(shell echo $(dir $(abspath $(lastword $(MAKEFILE_LIST)))) \
	| sed -e "s;/$$;;")

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

mpfr: mpfr-stamp
.PHONY: mpfr
mpfr-stamp: $(location)/common.sh $(location)/mpfr.sh
	rm -rf $@ mpfr
	mkdir mpfr
	(cd mpfr; $(location)/mpfr.sh) && touch $@

gdb: gdb-stamp
.PHONY: gdb
gdb-stamp: mpfr-stamp $(location)/common.sh $(location)/gdb.sh
	rm -rf $@ gdb
	mkdir gdb
	(cd gdb; $(location)/gdb.sh) && touch $@
