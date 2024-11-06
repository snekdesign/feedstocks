@echo off
cmake -B build ^
    -DBUILD_TESTS=OFF ^
    -DSTATIC_CRT=OFF ^
    -DUSE_SSH=exec ^
    %CMAKE_ARGS% && ^
cmake --build build --config Release && ^
cmake --install build
