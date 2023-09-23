@echo off
mkdir build ^
    && cd build ^
    && cmake ^
        -DCMAKE_BUILD_TYPE=Release ^
        -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
        -DJERRY_CMDLINE=OFF ^
        -DJERRY_EXT=OFF ^
        -G"Visual Studio 17 2022" ^
        .. ^
    && cmake --build . ^
    && cmake --install .
