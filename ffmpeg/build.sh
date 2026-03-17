# name conflict
SUBDIR=

mkdir -p "$SRC_DIR/build"
cd "$_"
LDFLAGS="$LDFLAGS -fuse-ld=lld" \
    PKG_CONFIG_PATH="$LIBRARY_LIB\\pkgconfig" \
    ../configure \
    --ar="$AR" \
    --cc="$CC" \
    --cpu=host \
    --cxx="$CXX" \
    --disable-avx512 \
    --disable-debug \
    --disable-fma4 \
    --disable-runtime-cpudetect \
    --disable-xop \
    --enable-gpl \
    --enable-libplacebo \
    --enable-libshaderc \
    --enable-lto \
    --enable-shared \
    --host-extralibs= \
    --ld="$CC" \
    --nm="$NM" \
    --ranlib="$RANLIB" \
    --strip=llvm-strip \
    --toolchain=msvc
make -j$CPU_COUNT
ln -t "$LIBRARY_BIN" lib*/*-*.dll ffmpeg.exe ffplay.exe ffprobe.exe
