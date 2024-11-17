@echo off
cd Source\Native\NSudoDevilMode && ^
cl /GL -I..\MINT /LD /MD /O2 ^
    NSudoDevilMode.cpp ^
    detours.cpp ^
    disasm.cpp ^
    kernel32.lib ^
    "%LIBRARY_PREFIX%\x86_64-w64-mingw32\sysroot\usr\lib\libntoskrnl.a" && ^
mklink /H "%LIBRARY_BIN%\NSudoDM.dll" NSudoDevilMode.dll && ^
md "%PREFIX%\etc\conda" && ^
cd "%PREFIX%\etc\conda" && ^
md activate.d deactivate.d && ^
copy "%RECIPE_DIR%\nsudodm_activate.ps1" activate.d && ^
copy "%RECIPE_DIR%\nsudodm_deactivate.ps1" deactivate.d
