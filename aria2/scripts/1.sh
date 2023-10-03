#!/usr/bin/bash
set -e

cd "$LIBRARY_LIB"
mv intl.lib intl.lib.bak
ln intl.dll.lib intl.lib
ln libssh2.lib ssh2.lib
cd "$PKG_CONFIG_SYSTEM_LIBRARY_PATH"
mv libintl.a libintl.a.bak
mv libsqlite3.a libsqlite3.a.bak

cd "$(dirname "${BASH_SOURCE:-$0}")/../aria2"
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
strip -s src/aria2c.exe

cd "$LIBRARY_LIB"
mv -f intl.lib.bak intl.lib
rm ssh2.lib
cd "$PKG_CONFIG_SYSTEM_LIBRARY_PATH"
mv libintl.a.bak libintl.a
mv libsqlite3.a.bak libsqlite3.a
