@echo off
cmake -B build -DJERRY_CMDLINE=OFF -DJERRY_EXT=OFF %CMAKE_ARGS% && ^
cmake --build build --config Release && ^
cmake --install build
