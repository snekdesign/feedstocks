@echo off
cmake -B build && ^
cmake --build build --config Release -t code && ^
cmake --install build --prefix "%LIBRARY_PREFIX%"
