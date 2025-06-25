for activate in "$(cygpath "$BUILD_PREFIX")"/etc/conda/activate.d/*.sh; do
    . "$activate"
done
cmake -B build -G Ninja $CMAKE_ARGS
cmake --build build -j $CPU_COUNT
cmake --install build --prefix "$LIBRARY_PREFIX" --strip
