@echo off
set MSYSTEM=UCRT64
usr\bin\bash -el "%RECIPE_DIR%\build.sh" && ^
md "%SCRIPTS%" && ^
copy "%RECIPE_DIR%\post-link.bat" "%SCRIPTS%\.%PKG_NAME%-post-link.bat"
