if [ -f "$PREFIX/bin/pixi-build-cmake" ]; then
    exit 0
fi
cargo install \
    --no-track \
    --path pixi-build-backends/crates/pixi-build \
    --root "$PREFIX"
