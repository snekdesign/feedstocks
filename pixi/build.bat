@echo off
for %%G in ("%RECIPE_DIR%") do set "CARGO_TARGET_X86_64_PC_WINDOWS_MSVC_LINKER=%%~dpGrust\link.cmd"
set "VC_LTL=%SRC_DIR%\vc_ltl"
set "YY_THUNKS=%SRC_DIR%\yy_thunks"
7z x -ovc_ltl VC-LTL-Binary.7z
cargo install --locked --no-track --path pixi --profile dist --root "%LIBRARY_PREFIX%"
