@echo off
md "%LIBRARY_BIN%" && ^
copy "%RECIPE_DIR%\klaus.cmd" "%LIBRARY_BIN%"
