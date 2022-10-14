set -eu

script_loc=`cd $(dirname $0) && pwd -P`

rm -rf binutils; mkdir binutils
(cd binutils; $script_loc/binutils.sh)

rm -rf gcc-boot; mkdir gcc-boot
(cd gcc-boot; $script_loc/gcc-boot.sh)

rm -rf newlib; mkdir newlib
(cd newlib; $script_loc/newlib.sh)

rm -rf gcc; mkdir gcc
(cd gcc; $script_loc/gcc.sh)

rm -rf gdb; mkdir gdb
(cd gdb; $script_loc/gdb.sh)
