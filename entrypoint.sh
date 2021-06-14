#!/bin/bash

srcdir=$1
outdir=$2

if [[ ! -d $srcdir ]]; then
    echo "$srcdir should be a directory."
    exit 1
fi

if [[ ! -e $srcdir/PKGBUILD ]]; then
    echo "$srcdir does not contain a PKGBUILD file."
    exit 1
fi

cd $srcdir
sudo chown -R build ./

# Build and Check the package
namcap PKGBUILD
makepkg
namcap *.pkg.tar.zst

# Save the artifacts
mkdir -p $outdir
cp *.pkg.tar.* $outdir/
