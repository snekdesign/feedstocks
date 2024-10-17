@echo off
cmake -B build -G "Visual Studio 17 2022" && ^
cmake --build build --config Release && ^
cmake --install build --prefix "%LIBRARY_PREFIX%"
