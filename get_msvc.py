import subprocess

import yaml


def main():
    with open('variants.yaml', encoding='ascii') as f:
        match yaml.safe_load(f):
            case {
                'c_compiler': [
                    _,
                    {'if': 'win', 'then': str(c_compiler)},
                ],
                'c_compiler_version': [
                    _,
                    {'if': 'win', 'then': str(c_compiler_version)},
                ],
                'cxx_compiler': [
                    _,
                    {'if': 'win', 'then': str(cxx_compiler)},
                ],
                'cxx_compiler_version': [
                    _,
                    {'if': 'win', 'then': str(cxx_compiler_version)},
                ],
            } if (
                c_compiler == cxx_compiler
                and c_compiler.startswith('vs20')
                and c_compiler_version == cxx_compiler_version
            ):
                pass
            case _:
                raise ValueError('Cannot decide MSVC version')
    major, minor = map(int, c_compiler_version.split('.', 1))
    major -= 2
    minor -= 30
    subprocess.run(
        f'curl -LO https://aka.ms/vs/{major}/release.ltsc.{major}.{minor}/vs_BuildTools.exe',
        check=True,
    )


if __name__ == '__main__':
    main()
