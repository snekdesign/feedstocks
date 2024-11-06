@echo off
md "%LIBRARY_PREFIX%\opt\vscodium" "%PREFIX%\etc\conda\activate.d" && ^
cp -al . "%LIBRARY_PREFIX%\opt\vscodium" && ^
copy "%RECIPE_DIR%\vscodium_activate-win.*" "%PREFIX%\etc\conda\activate.d"
