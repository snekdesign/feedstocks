@echo off
bash -l "%CD%\scripts\1.sh" ^
    && rm -r "%LIBRARY_PREFIX%\home" ^
    && mklink /H "%LIBRARY_BIN%\aria2c.exe" aria2\build\src\aria2c.exe
