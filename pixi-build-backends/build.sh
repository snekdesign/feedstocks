if [ -f "$PREFIX/bin/pixi-build-cmake" ]; then
    exit 0
fi
cargo install \
    --locked \
    --no-track \
    --path pixi-build-backends/crates/pixi-build-cmake \
    --root "$PREFIX"
cargo install \
    --locked \
    --no-track \
    --path pixi-build-backends/crates/pixi-build-mojo \
    --root "$PREFIX"
cargo install \
    --locked \
    --no-track \
    --path pixi-build-backends/crates/pixi-build-python \
    --root "$PREFIX"
cargo install \
    --locked \
    --no-track \
    --path pixi-build-backends/crates/pixi-build-rattler-build \
    --root "$PREFIX"
cargo install \
    --locked \
    --no-track \
    --path pixi-build-backends/crates/pixi-build-rust \
    --root "$PREFIX"
