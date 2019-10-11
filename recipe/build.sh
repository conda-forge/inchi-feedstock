#!/bin/bash

# Build and install libinchi
mkdir -p $PREFIX/lib
cd $SRC_DIR/INCHI_API/libinchi/gcc
make C_COMPILER="$CC" SHARED_LINK="$CC -shared" LINKER="$CC -s -Wl,-R,''" LIB_DIR="$PREFIX/lib"

# Create lib symlinks without version numbers
if [[ `uname` == 'Darwin' ]]; then
    ln -s $PREFIX/lib/libinchi.1.05.00.dylib $PREFIX/lib/libinchi.dylib
else
    ln -s $PREFIX/lib/libinchi.so.1.05.00 $PREFIX/lib/libinchi.so
fi

# Build and install inchi-1 executable
mkdir -p $PREFIX/bin 
cd $SRC_DIR/INCHI_EXE/inchi-1/gcc
make C_COMPILER="$CC" LINKER="$CC -s" BIN_DIR="$PREFIX/bin"

# Install headers
mkdir -p $PREFIX/include/inchi
cp $SRC_DIR/INCHI_API/libinchi/src/*.h $PREFIX/include/inchi/
cp $SRC_DIR/INCHI_BASE/src/*.h $PREFIX/include/inchi/
