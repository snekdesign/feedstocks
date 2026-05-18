# feedstocks
## Dependencies
- [Pixi][1] >=0.63.0
- [MSVC Build Tools v14.51][2]
- Xcode or Xcode Command Line Tools (macOS only)
## Usage
```
[sudo] pixi run build <package-name>
```
## License
Recipes in this repo are published under [GPL-2.0-only][3] and [Anti-996][4]
licenses, except for the [ffdec][5] and [zed][6] recipes which must use the
GPL-3.0-or-later license due to its restriction.

This repo comes with no pre-built packages. If you have packages built with
recipes here and want to distribute them, make sure their own licenses are not
violated.

[1]: https://pixi.sh/
[2]: https://devblogs.microsoft.com/cppblog/microsoft-c-msvc-build-tools-v14-51-preview-released-how-to-opt-in/
[3]: LICENSE#L1-L339
[4]: LICENSE#L343-L388
[5]: ffdec
[6]: zed
