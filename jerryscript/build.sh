mkdir build
cd build
CFLAGS="$CFLAGS -Wno-maybe-uninitialized" \
    cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$PREFIX" \
    -DENABLE_LTO=OFF \
    -DJERRY_CMDLINE=OFF \
    -DJERRY_EXT=OFF \
    ..
cmake --build . -j`nproc`
cmake --install . --strip
