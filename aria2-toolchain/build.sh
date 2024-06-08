for x in /etc/pacman.d/mirrorlist.*; do
    head -n 4 $x |
        sed 's mirror\.msys2\.org mirrors.ustc.edu.cn/msys2 ' > $x.pacnew
    mv -f $x.pacnew $x
done

pacman -Sy --noconfirm \
    $MINGW_PACKAGE_PREFIX-autotools \
    $MINGW_PACKAGE_PREFIX-gcc \
    $MINGW_PACKAGE_PREFIX-sqlite3

pacman -Rc --noconfirm dash mintty
pacman -Scc --noconfirm

mkdir -p "$LIBRARY_PREFIX"
cd "$LIBRARY_PREFIX"
GLOBIGNORE='/bin:/dev:/home:/proc:/build_env_setup.bat:/conda_build.bat'
cp -al /* .
rm var/log/pacman.log
for x in dev/mqueue dev/shm tmp; do
    mkdir -p $x
    touch $x/.empty
done
