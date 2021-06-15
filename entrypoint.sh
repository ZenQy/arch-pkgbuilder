#!/bin/bash

echo $PWD
ls -l ../
srcdir=$1

if [[ ! -d $srcdir ]]; then
    echo "$srcdir should be a directory."
    exit 1
fi

if [[ ! -e $srcdir/PKGBUILD ]]; then
    echo "$srcdir does not contain a PKGBUILD file."
    exit 1
fi

sudo chown -R build $srcdir /github/home
cd $srcdir

# Build and Check the package
namcap PKGBUILD
makepkg -s --noconfirm
namcap *.pkg.tar.zst
