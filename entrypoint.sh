#!/bin/bash

echo $PWD
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

sudo mkdir -p $outdir
sudo chown -R build $srcdir $outdir
cd $srcdir

# Build and Check the package
namcap PKGBUILD
makepkg
namcap *.pkg.tar.zst

# Save the artifacts
cp *.pkg.tar.* ../$outdir/

