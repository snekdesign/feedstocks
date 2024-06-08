@echo off
md "%LIBRARY_PREFIX%\etc" && ^
copy "%RECIPE_DIR%\SumatraPDF-settings.txt" "%LIBRARY_PREFIX%\etc" && ^
msbuild vs2022\SumatraPDF.vcxproj -p:Configuration=Release;Platform=x64 && ^
mklink /H "%LIBRARY_BIN%\SumatraPDF.exe" out\rel64\SumatraPDF.exe
