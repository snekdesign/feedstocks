cd "$LIBRARY_LIB"
ln intl.dll.lib libintl.a
ln libssh2.lib libssh2.a
ln sqlite3.lib libsqlite3.a
ln zlib.lib libz.a

cd "$SRC_DIR"
autoreconf -i
mkdir -p build
cd build
PKG_CONFIG_PATH="$(cygpath "$LIBRARY_LIB/pkgconfig"):$PKG_CONFIG_PATH" \
    ../configure \
    --without-wintls \
    --with-libiconv-prefix="$(cygpath "$LIBRARY_PREFIX")" \
    --with-libintl-prefix="$(cygpath "$LIBRARY_PREFIX")" \
    ARIA2_STATIC=yes
make -j`nproc`
strip -so "$LIBRARY_BIN/aria2c.exe" src/aria2c.exe

rm "$LIBRARY_LIB"/lib*.a
