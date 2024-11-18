@echo off
if EXIST "%LIBRARY_BIN%\cmd.dll" ( exit 0 )
call configure.cmd %CMAKE_ARGS% && ^
cd output-VS-amd64 && ^
ninja base\shell\cmd\cmd.dll && ^
cd base\shell\cmd && ^
mklink /H "%LIBRARY_BIN%\cmd.dll" cmd.dll && ^
md "%LIBRARY_INC%" "%LIBRARY_LIB%" && ^
mklink /H "%LIBRARY_LIB%\cmd.lib" cmd.lib && ^
copy "%RECIPE_DIR%\cmd.h" "%LIBRARY_INC%"
