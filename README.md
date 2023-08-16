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

[1]: https://github.com/mamba-org/boa
[2]: https://learn.microsoft.com/en-us/visualstudio/releases/2022/release-history#evergreen-bootstrappers
