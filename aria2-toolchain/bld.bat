@echo off
set MSYSTEM=UCRT64
cd msys64 || exit /b 1
usr\bin\bash -l "%CD%\..\scripts\1.sh"
usr\bin\bash -l "%CD%\..\scripts\2.sh" || exit /b 1
rd /S /Q home || exit /b 1
mklink /H usr\lib\librt.a ..\msys2-runtime-devel\usr\lib\librt.a || exit /b 1

robocopy . "%LIBRARY_PREFIX%" *.* /E
rem https://ss64.com/nt/robocopy-exit.html
if %ERRORLEVEL% GEQ 8 (
    exit /b 1
)
exit /b 0
