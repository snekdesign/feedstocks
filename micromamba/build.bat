@echo off
set "VCPKG_ROOT=%SRC_DIR%\vcpkg"
"%VCPKG_ROOT%\vcpkg" install --triplet x64-windows-static-md && ^
cmake -Bbuild -DBUILD_LIBMAMBA=ON -DBUILD_MICROMAMBA=ON -GNinja %CMAKE_ARGS% && ^
cmake --build build && ^
mklink /H "%LIBRARY_BIN%\micromamba.exe" build\micromamba\micromamba.exe
