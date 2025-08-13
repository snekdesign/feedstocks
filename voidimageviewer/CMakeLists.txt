cmake_minimum_required(VERSION 4.0)

project(voidimageviewer LANGUAGES C)

add_executable(
    voidimageviewer
    WIN32
    res/voidimageviewer.manifest
    res/voidimageviewer.rc
    src/config.c
    src/crt.c
    src/debug.c
    src/ini.c
    src/mem.c
    src/os.c
    src/render_d3d.c
    src/render_gdi.c
    src/render_opengl.c
    src/render_software.c
    src/render.c
    src/safe_size.c
    src/small_pool.c
    src/string.c
    src/utf8.c
    src/viv.c
    src/wchar.c
    src/webp.c
)
target_compile_definitions(voidimageviewer PRIVATE UNICODE VERSION_X64)
target_include_directories(voidimageviewer PRIVATE libwebp)
target_link_directories(voidimageviewer PRIVATE $ENV{LIBRARY_LIB})
target_link_libraries(
    voidimageviewer
    PRIVATE
    comctl32
    libwebp
    libwebpdemux
    shlwapi
)
install(TARGETS voidimageviewer)
