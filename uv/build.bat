@echo off
set "VC_LTL=%SRC_DIR%\vc_ltl"
set "YY_THUNKS=%SRC_DIR%\yy_thunks"
cargo install ^
    --config target.x86_64-pc-windows-msvc.linker=\"link\" ^
    --features windows-gui-bin ^
    --locked ^
    --no-track ^
    --path uv\crates\uv ^
    --profile minimal-size ^
    --root "%LIBRARY_PREFIX%"
