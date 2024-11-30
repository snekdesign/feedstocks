@echo off
if not defined KLAUS_REPOS if exist .git (
    set KLAUS_REPOS=%CD%
    if not defined KLAUS_SITE_NAME set KLAUS_SITE_NAME=Git
) else (
    klaus %*
    exit /b %ERRORLEVEL%
)
fastwsgi klaus.contrib.wsgi:application %*
