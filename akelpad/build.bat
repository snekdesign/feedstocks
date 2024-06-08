@echo off
cmake -B build %CMAKE_ARGS% && ^
cmake --build build --config Release && ^
cmake --install build
