@echo off
mklink /H License.txt DOC\License.txt && ^
cd CPP\7zip\Bundles\Alone2 && ^
nmake MY_DYNAMIC_LINK=1 PLATFORM=x64 && ^
mklink /H "%LIBRARY_BIN%\7zz.exe" x64\7zz.exe && ^
cd ..\SFXWin && ^
nmake PLATFORM=x64 && ^
mklink /H "%LIBRARY_BIN%\7z.sfx" x64\7z.sfx
