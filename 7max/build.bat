@echo off
7zz x *.7z && ^
mklink /H copying.txt DOC\copying.txt && ^
cd CPP\Utils\7max\Console && ^
nmake MY_DYNAMIC_LINK=1 PLATFORM=x64 && ^
mklink /H "%LIBRARY_BIN%\7maxc.exe" x64\7maxc.exe && ^
cd ..\DLL && ^
nmake MY_DYNAMIC_LINK=1 PLATFORM=x64 && ^
mklink /H "%LIBRARY_BIN%\7max.dll" x64\7max.dll
