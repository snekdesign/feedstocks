@echo off
if EXIST "%LIBRARY_BIN%\pixi-build-cmake.exe" ( exit 0 )
cargo install ^
    --locked ^
    --no-track ^
    --path pixi-build-backends/crates/pixi-build-cmake ^
    --root "%LIBRARY_PREFIX%" && ^
cargo install ^
    --locked ^
    --no-track ^
    --path pixi-build-backends/crates/pixi-build-python ^
    --root "%LIBRARY_PREFIX%" && ^
cargo install ^
    --locked ^
    --no-track ^
    --path pixi-build-backends/crates/pixi-build-rattler-build ^
    --root "%LIBRARY_PREFIX%" && ^
cargo install ^
    --locked ^
    --no-track ^
    --path pixi-build-backends/crates/pixi-build-rust ^
    --root "%LIBRARY_PREFIX%"
