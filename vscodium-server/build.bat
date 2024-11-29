@echo off
md "%LIBRARY_BIN%" "%LIBRARY_PREFIX%\opt" && ^
cp -al vscodium-server "%LIBRARY_PREFIX%\opt" && ^
del "%LIBRARY_PREFIX%\opt\vscodium-server\node.exe" && ^
copy "%RECIPE_DIR%\code-server.cmd" "%LIBRARY_BIN%"
