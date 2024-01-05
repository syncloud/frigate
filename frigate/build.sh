#!/bin/sh -ex

DIR=$( cd "$( dirname "$0" )" && pwd )
cd ${DIR}
VERSION=$1
BUILD_DIR=${DIR}/../build/snap/frigate
mkdir $BUILD_DIR
cp -r /opt ${BUILD_DIR}/opt
cp -r /usr ${BUILD_DIR}/usr
cp -r /bin ${BUILD_DIR}/bin
cp -r ${DIR}/bin/* ${BUILD_DIR}/bin
