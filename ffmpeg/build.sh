# name conflict
SUBDIR=

mkdir -p "$SRC_DIR/build"
cd "$_"
LDFLAGS="$LDFLAGS -fuse-ld=lld" \
    PKG_CONFIG_PATH="$LIBRARY_LIB\\pkgconfig" \
    ../configure \
    --ar="$AR" \
    --cc=clang \
    --cpu=host \
    --cxx=clang++ \
    --disable-avx512 \
    --disable-debug \
    --disable-fma4 \
    --disable-runtime-cpudetect \
    --disable-xop \
    --enable-gpl \
    --enable-libplacebo \
    --enable-lto \
    --enable-shared \
    --host-extralibs= \
    --ld=clang \
    --nm=llvm-nm \
    --ranlib=llvm-ranlib \
    --strip=llvm-strip \
    --toolchain=msvc
make -j$CPU_COUNT
ln -t "$LIBRARY_BIN" lib*/*-*.dll ffmpeg.exe ffplay.exe ffprobe.exe
