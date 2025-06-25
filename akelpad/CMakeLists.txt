cmake_minimum_required(VERSION 3.21)

project(AkelPad LANGUAGES C)

include(CheckIPOSupported)
check_ipo_supported()
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON)

add_executable(
    AkelPad
    WIN32
    AkelPad.c
    Edit.c
    AkelEdit/AkelEdit.c
    "AkelFiles/Langs/Resources/Chinese (Simplified).rc"
    AkelFiles/Langs/Resources/AkelPad-x64.exe.manifest
)
target_compile_definitions(
    AkelPad
    PRIVATE
    AKELEDIT_STATICBUILD
    $<$<COMPILE_LANGUAGE:RC>:RC_EXEVERSION>
    RC_VERSIONBIT=64
    RC_VERSIONLANGID=0x804
)
target_include_directories(AkelPad PRIVATE AkelEdit/Resources)
target_link_libraries(AkelPad comctl32 imm32 version)
if(MSVC)
    target_link_options(AkelPad PRIVATE /ENTRY:_WinMain)
else()
    target_link_options(AkelPad PRIVATE -e_WinMain)
endif()
install(TARGETS AkelPad)
