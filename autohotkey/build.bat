@echo off
md "%LIBRARY_PREFIX%\etc\inc" && ^
msbuild AutoHotkeyx.vcxproj -p:Configuration=Release;Platform=x64 && ^
mklink /H "%LIBRARY_BIN%\AutoHotkey.exe" bin\AutoHotkey64.exe && ^
mklink /H "%LIBRARY_PREFIX%\etc\AutoHotkey.chm" bin\AutoHotkey.chm && ^
mklink /H "%LIBRARY_PREFIX%\etc\WindowSpy.ahk" bin\UX\WindowSpy.ahk && ^
mklink /H "%LIBRARY_PREFIX%\etc\inc\spy.ico" bin\UX\inc\spy.ico
