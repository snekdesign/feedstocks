#!/usr/bin/bash
set -e
pacman -Su --noconfirm
pacman -S --noconfirm \
    $MINGW_PACKAGE_PREFIX-autotools \
    $MINGW_PACKAGE_PREFIX-gcc \
    $MINGW_PACKAGE_PREFIX-sqlite3
pacman -Scc --noconfirm
touch /dev/mqueue/.empty /dev/shm/.empty /tmp/.empty
rm /var/log/pacman.log
