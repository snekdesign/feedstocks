# feedstocks
## Supported OS
- Windows >=10 x86_64
- Linux glibc x86_64
## Dependencies
- [boa][1] >0.15.1
- MSVC 17.6.* [LTSC][2] (Windows only)
- CMake >=3.21 (installed along with MSVC, Windows only)
## Usage
```
boa build --pkg-format=2 <package-name>
```
## License
Recipes in this repo are published under [GPL-2.0-only][3] and [Anti-996][4]
licenses.

This repo comes with no pre-built packages. If you have packages built with
recipes here and want to distribute them, make sure their own licenses are not
violated.

[1]: https://github.com/mamba-org/boa
[2]: https://learn.microsoft.com/en-us/visualstudio/releases/2022/release-history#evergreen-bootstrappers
[3]: LICENSE#L1-L339
[4]: LICENSE#L343-L388
