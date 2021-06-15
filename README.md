# Arch Linux PKGBUILD builder action

<p align="center">
  <a href="https://github.com/countstarlight/arch-makepkg-action/actions">
    <img src="https://img.shields.io/github/workflow/status/countstarlight/arch-makepkg-action/Build%20docker/master?logo=github&style=flat-square" alt="Build Status">
  </a>
  <a href="https://github.com/countstarlight/arch-makepkg-action/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/countstarlight/arch-makepkg-action?style=flat-square" alt="License">
  </a>
</p>

This action builds an Arch Linux package. 

## Usage

```yaml
steps:
- name: build arch package
  uses: zenqy/arch-pkgbuilder@main
  with:
    pkgdir: 'path/to/PKGBUILD'
```

## Used by

So far this action is used by the following packages:

* [archrepo](https://github.com/ZenQy/archrepo)

## License
The scripts and documentation in this project are released under the [MIT License](LICENSE)