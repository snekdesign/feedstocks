@echo off
cd src
cl -DUNICODE -Fe"%LIBRARY_BIN%\es.exe" -GL -MD -O2 cli.c shlwapi.lib user32.lib
