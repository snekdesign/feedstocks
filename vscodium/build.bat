@echo off
md "%LIBRARY_BIN%" "%LIBRARY_PREFIX%\opt\vscodium" && ^
cp -al . "%LIBRARY_PREFIX%\opt\vscodium" && ^
copy "%RECIPE_DIR%\code.cmd" "%LIBRARY_BIN%"
