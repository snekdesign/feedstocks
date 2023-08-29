@echo off
msys64\usr\bin\bash -l "%CD%\scripts\1.sh"
msys64\usr\bin\bash -l "%CD%\scripts\2.sh" ^
    && msys64\usr\bin\rm -r msys64\home ^
    && msys64\usr\bin\cp -alT msys64 "%LIBRARY_PREFIX%"
