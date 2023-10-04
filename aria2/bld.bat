@echo off
bash -el "%RECIPE_DIR%\build.sh"
rem boa and rattler-build don't support .aria2-toolchain-post-link.bat
rem see https://github.com/mamba-org/boa/issues/371
rm -r "%LIBRARY_PREFIX%\home"
