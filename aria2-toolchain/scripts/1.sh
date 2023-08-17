#!/usr/bin/bash
set -e
for x in /etc/pacman.d/mirrorlist.*; do
    head -n 4 $x |
        sed 's mirror\.msys2\.org mirrors.cernet.edu.cn/msys2 ' > $x.pacnew
    mv -f $x.pacnew $x
done
pacman -Rc --noconfirm dash mintty
pacman -Syu --noconfirm
