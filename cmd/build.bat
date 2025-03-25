@echo off
call configure.cmd %CMAKE_ARGS% && ^
cd output-VS-amd64 && ^
ninja base\shell\cmd\cmd.exe && ^
mklink /H "%LIBRARY_BIN%\cmd.exe" base\shell\cmd\cmd.exe
