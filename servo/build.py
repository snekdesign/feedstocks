import glob
import os
import pathlib
import shutil
import string
import subprocess


def main() -> None:
    match os.environ:
        case {
            'BUILD_PREFIX': build_prefix,
            'LIBRARY_BIN': library_bin,
            'LIBRARY_PREFIX': root,
            'SRC_DIR': src_dir,
            'TEMP': temp,
        }:
            pass
        case _:
            assert False
    cwd = pathlib.Path(src_dir)
    libclang_path = pathlib.Path(build_prefix, 'Library', 'bin')
    profile = 'production-stripped'
    target_dir = os.path.join(_dev_drive_or(temp), cwd.parent.name)
    subprocess.run(
        [
            'cargo', 'install',
            '-F', 'media-gstreamer',
            '--locked',
            '--no-track',
            '--path', 'ports/servoshell',
            '--profile', profile,
            '--root', root,
            '--target-dir', target_dir,
        ],
        check=True,
        env=dict(
            os.environ,
            LIBCLANG_PATH=str(next(libclang_path.glob('libclang-*.dll'))),
            MOZJS_ARCHIVE=str(cwd / 'libmozjs.tar.gz'),
        ),
    )
    for dll in glob.iglob(
        os.path.join(
            target_dir,
            profile,
            'build',
            'mozangle-*',
            'out',
            'lib*GL*.dll',
        ),
    ):
        shutil.copy(dll, library_bin)
    shutil.rmtree(target_dir, ignore_errors=True)
    subprocess.run(
        ['cp', '-al', 'resources', os.path.join(root, 'share', 'servo')],
        check=True,
    )


def _dev_drive_or(temp: str) -> str:
    if os.path.isdevdrive(temp):
        return temp
    match list(
        filter(
            os.path.isdevdrive,
            map('{}:\\'.format, string.ascii_uppercase),
        ),
    ):
        case []:
            return temp
        case [candidate]:
            return candidate
        case candidates:
            return max(candidates, key=lambda x: shutil.disk_usage(x).free)


if __name__ == '__main__':
    main()
