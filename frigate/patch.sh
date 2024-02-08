#!/bin/sh -ex

DIR=$( cd "$( dirname "$0" )" && pwd )
VERSION=$1
BUILD_DIR=${DIR}/../build/snap/frigate

apk add patch

wget https://github.com/blakeblackshear/frigate/compare/v$VERSION...cyberb:frigate:v$VERSION-fix.patch -O $DIR/fix.patch
cd $BUILD_DIR/opt/frigate
patch -p2 < $DIR/fix.patch
