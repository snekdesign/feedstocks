@echo off
msbuild Source\Native\NSudoDevilMode\NSudoDevilMode.vcxproj -p:Configuration=Release;Platform=x64 && ^
mklink /H "%LIBRARY_BIN%\NSudoDM.dll" Source\Native\Output\Binaries\Release\x64\NSudoDM.dll
