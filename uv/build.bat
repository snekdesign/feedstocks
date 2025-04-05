@echo off
set "VC_LTL=%SRC_DIR%\vc_ltl"
set "YY_THUNKS=%SRC_DIR%\yy_thunks"
7z x -ovc_ltl VC-LTL-Binary.7z
cargo install ^
    --config target.x86_64-pc-windows-msvc.linker=\"link\" ^
    --no-track ^
    --path uv\crates\uv ^
    --root "%LIBRARY_PREFIX%"
