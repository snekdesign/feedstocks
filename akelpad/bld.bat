@echo off
md akelpad_4\build ^
    && cd akelpad_4\build ^
    && cmake ^
        -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
        -G"Visual Studio 17 2022" ^
        .. ^
    && cmake --build . --config Release ^
    && cmake --install .
