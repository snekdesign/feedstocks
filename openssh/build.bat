@echo off
cd contrib\win32\openssh && ^
sed -i ^
    -e "s MultiThreaded< MultiThreadedDLL< " ^
    -e "s %%(PreprocessorDefinitions) HAVE_STRNLEN;%%(PreprocessorDefinitions) " ^
    -e "s >Spectre< >false< " ^
    config.vcxproj ^
    keygen.vcxproj ^
    libssh.vcxproj ^
    openbsd_compat.vcxproj ^
    scp.vcxproj ^
    sftp-server.vcxproj ^
    sftp.vcxproj ^
    ssh-add.vcxproj ^
    ssh-agent.vcxproj ^
    ssh-keyscan.vcxproj ^
    ssh-pkcs11-helper.vcxproj ^
    ssh-shellhost.vcxproj ^
    ssh-sk-helper.vcxproj ^
    ssh.vcxproj ^
    sshd-session.vcxproj ^
    sshd.vcxproj ^
    unittest-bitmap.vcxproj ^
    unittest-hostkeys.vcxproj ^
    unittest-kex.vcxproj ^
    unittest-match.vcxproj ^
    unittest-misc.vcxproj ^
    unittest-sshbuf.vcxproj ^
    unittest-sshkey.vcxproj ^
    unittest-utf8.vcxproj ^
    unittest-win32compat.vcxproj ^
    win32iocompat.vcxproj && ^
msbuild -p:Configuration=Release;Platform=x64 Win32-OpenSSH.sln && ^
mklink /H "%LIBRARY_BIN%\libcrypto.dll" LibreSSL\bin\desktop\X64\libcrypto.dll && ^
copy "%SRC_DIR%\bin\x64\Release\*.exe" "%LIBRARY_BIN%" && ^
md "%PREFIX%\etc\conda" && ^
cd "%PREFIX%\etc\conda" && ^
md activate.d deactivate.d && ^
copy "%RECIPE_DIR%\*_activate-win.*" activate.d && ^
copy "%RECIPE_DIR%\*_deactivate-win.*" deactivate.d
