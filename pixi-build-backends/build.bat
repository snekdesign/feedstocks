@echo off
if EXIST "%LIBRARY_BIN%\pixi-build-cmake.exe" ( exit 0 )
cargo install ^
    --no-track ^
    --path pixi-build-backends/crates/pixi-build ^
    --root "%LIBRARY_PREFIX%"
