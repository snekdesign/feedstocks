@echo off
md "%LIBRARY_BIN%" ^
    "%LIBRARY_PREFIX%\share\java\pdftk" ^
    "%LIBRARY_PREFIX%\share\man\man1" && ^
mklink /H "%LIBRARY_BIN%\pdftk.cmd" "%RECIPE_DIR%\pdftk.cmd"
mklink /H "%LIBRARY_PREFIX%\share\java\pdftk\pdftk-all.jar" pdftk-all.jar
mklink /H "%LIBRARY_PREFIX%\share\man\man1\pdftk.1" pdftk.1
