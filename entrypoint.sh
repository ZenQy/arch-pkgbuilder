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

# Prepare the environment
pacman -Syu --noconfirm --noprogressbar --needed base-devel devtools btrfs-progs dbus

dbus-uuidgen --ensure=/etc/machine-id

sed -i "s|MAKEFLAGS=.*|MAKEFLAGS=-j$(nproc)|" /etc/makepkg.conf

useradd -m user
echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
cd $srcdir
chown -R user ./

# Build the package
extra-x86_64-build -- -U user

# Save the artifacts
mkdir -p $outdir
cp *.pkg.* $outdir/