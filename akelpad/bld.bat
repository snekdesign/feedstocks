@echo off
md trunk\akelpad_4\build ^
    && cd trunk\akelpad_4\build ^
    && cmake ^
        -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
        -G"Visual Studio 17 2022" ^
        .. ^
    && cmake --build . --config Release ^
    && cmake --install .
