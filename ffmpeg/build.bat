@echo off
bash -el "%RECIPE_DIR%\build.sh" && ^
cd /d "%LIBRARY_PREFIX%"
if %ERRORLEVEL% neq 0 exit 1
rm -rf dev etc home usr/share/info/dir || ^
break
