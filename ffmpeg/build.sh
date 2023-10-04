# name conflict
SUBDIR=

mkdir -p build
cd build
CFLAGS="$CFLAGS -MD" \
    PKG_CONFIG_PATH="$LIBRARY_LIB\pkgconfig" \
    ../configure \
    --disable-debug \
    --enable-gpl \
    --enable-shared \
    --toolchain=msvc
make -j`nproc`
ln -t "$LIBRARY_BIN" lib*/*-*.dll ffmpeg.exe ffplay.exe ffprobe.exe
