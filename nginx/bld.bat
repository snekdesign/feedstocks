@echo off
bash -l "%CD%\scripts\1.sh" ^
    && cp -al nginx\objs\nginx.exe "%LIBRARY_BIN%"
