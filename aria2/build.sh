CONDA_BUILD=
for activate in "$(cygpath "$BUILD_PREFIX")"/etc/conda/activate.d/*.sh; do
    . $activate
done

cd "$LIBRARY_LIB"
ln intl.dll.lib libintl.dll.a
ln libssh2.lib libssh2.dll.a
ln sqlite3.lib libsqlite3.dll.a
ln zlib.lib libz.dll.a

cat > pkgconfig/sqlite3.pc <<EOF
Name: SQLite
Description: SQL database engine
Version: $SQLITE_VERSION
Libs: -lsqlite3
Libs.private: -lz
EOF

cd "$SRC_DIR"
mkdir /usr/share/gettext
ln ucrt64/share/gettext/archive.dir.tar.xz $_

autoreconf -i
mkdir -p build
cd build
PKG_CONFIG_PATH="$(cygpath "$LIBRARY_LIB/pkgconfig"):$PKG_CONFIG_PATH" \
    ../configure \
    --without-wintls \
    --with-libiconv-prefix="$(cygpath "$LIBRARY_PREFIX")" \
    --with-libintl-prefix="$(cygpath "$LIBRARY_PREFIX")"
until make -j$CPU_COUNT; do :; done  # Link fails randomly
"$STRIP" -so "$LIBRARY_BIN/aria2c.exe" src/.libs/aria2c.exe

cd "$LIBRARY_LIB"
rm lib*.dll.a pkgconfig/sqlite3.pc /usr/share/gettext/archive.dir.tar.xz
