@echo off
mklink /H "%LIBRARY_PREFIX%\etc\SumatraPDF-settings.txt" SumatraPDF-settings.txt ^
    && msbuild vs2022\SumatraPDF.vcxproj -p:Configuration=Release;Platform=x64 ^
    && mklink /H "%LIBRARY_BIN%\SumatraPDF.exe" out\rel64\SumatraPDF.exe
