mkdir -p "$PREFIX/bin" "$PREFIX/share/java/pdftk" "$PREFIX/share/man/man1"
ln "$RECIPE_DIR/pdftk" "$PREFIX/bin"
chmod +x "$PREFIX/bin/pdftk"
ln pdftk-all.jar "$PREFIX/share/java/pdftk"
ln pdftk.1 "$PREFIX/share/man/man1"