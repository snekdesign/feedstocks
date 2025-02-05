@echo off
cd Source\Native\NSudoDevilMode && ^
cl /GL -I..\MINT /LD /MD /O2 ^
    NSudoDevilMode.cpp ^
    detours.cpp ^
    disasm.cpp ^
    kernel32.lib ^
    ntdll.lib ^
    "%LIBRARY_PREFIX%\x86_64-w64-mingw32\sysroot\usr\lib\libntoskrnl.a" && ^
mklink /H "%LIBRARY_BIN%\NSudoDM.dll" NSudoDevilMode.dll
