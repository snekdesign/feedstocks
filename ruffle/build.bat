@echo off
set "LIBCLANG_PATH=%BUILD_PREFIX%\Library\bin\libclang-13.dll"
cd ruffle && ^
cargo build --release --all-features && ^
mklink /H "%LIBRARY_BIN%\ruffle.exe" target\release\ruffle_desktop.exe
