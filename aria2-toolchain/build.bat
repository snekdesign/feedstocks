@echo off
set MSYSTEM=UCRT64
usr\bin\bash -el "%RECIPE_DIR%\build.sh" && ^
md "%SCRIPTS%" && ^
mklink /H "%SCRIPTS%\.%PKG_NAME%-post-link.bat" "%RECIPE_DIR%\post-link.bat"
