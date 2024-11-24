@echo off
md "%LIBRARY_BIN%" "%LIBRARY_PREFIX%\opt" && ^
cp -al vscodium "%LIBRARY_PREFIX%\opt" && ^
copy "%RECIPE_DIR%\code.cmd" "%LIBRARY_BIN%"
