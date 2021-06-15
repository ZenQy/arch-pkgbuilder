#!/bin/bash

pkgdir=$1

if [[ ! -d $pkgdir ]]; then
    echo "$pkgdir should be a directory."
    exit 1
fi

if [[ ! -e $pkgdir/PKGBUILD ]]; then
    echo "$pkgdir does not contain a PKGBUILD file."
    exit 1
fi

# Build and Check the package
cd $pkgdir
namcap PKGBUILD
makepkg -s --noconfirm
namcap *.pkg.tar.zst
