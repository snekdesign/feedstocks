@echo off
md "%LIBRARY_PREFIX%\opt" "%PREFIX%\etc\conda\activate.d" && ^
cp -al vscodium-server "%LIBRARY_PREFIX%\opt" && ^
copy "%RECIPE_DIR%\*_activate-win.*" "%PREFIX%\etc\conda\activate.d"
