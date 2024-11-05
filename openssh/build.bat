@echo off
cd contrib\win32\openssh && ^
msbuild -p:Configuration=Release;Platform=x64 Win32-OpenSSH.sln && ^
mklink /H "%LIBRARY_BIN%\libcrypto.dll" LibreSSL\bin\desktop\X64\libcrypto.dll && ^
copy "%SRC_DIR%\bin\x64\Release\*.exe" "%LIBRARY_BIN%" && ^
md "%PREFIX%\etc\conda" && ^
cd "%PREFIX%\etc\conda" && ^
md activate.d deactivate.d && ^
copy "%RECIPE_DIR%\*_activate-win.*" activate.d && ^
copy "%RECIPE_DIR%\*_deactivate-win.*" deactivate.d
