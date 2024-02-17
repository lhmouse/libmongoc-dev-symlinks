#!/bin/bash -e

_pkgname=libmogoc-dev-symlinks
_pkgversion=$(git describe --tag | sed 's/^[^0-9]//')
_tempdir=$(readlink -f "./.makedeb")

rm -rf ${_tempdir}
mkdir -p ${_tempdir}
cp -pr DEBIAN -t ${_tempdir}

pushd ${_tempdir}
mkdir -p usr/include
mkdir -p usr/local/include
ln -s libbson-1.0/bson usr/include/bson
ln -s libbson-1.0/bson usr/local/include/bson
ln -s libmongoc-1.0/mongoc usr/include/mongoc
ln -s libmongoc-1.0/mongoc usr/local/include/mongoc
popd

sed -i "s/{_pkgname}/${_pkgname}/" ${_tempdir}/DEBIAN/control
sed -i "s/{_pkgversion}/${_pkgversion}/" ${_tempdir}/DEBIAN/control

dpkg-deb --root-owner-group --build .makedeb "${_pkgname}_${_pkgversion}_${_pkgarch}.deb"
