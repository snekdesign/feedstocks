@echo off
set "SolutionDir=%SRC_DIR%\"
msbuild src\host\exe\Host.EXE.vcxproj -p:Configuration=Release;Platform=x64 && ^
mklink /H "%LIBRARY_BIN%\OpenConsole.exe" bin\x64\Release\OpenConsole.exe
