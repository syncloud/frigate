#!/bin/sh -ex

DIR=$( cd "$( dirname "$0" )" && pwd )
cd ${DIR}
VERSION=$1
BUILD_DIR=${DIR}/../build/snap/frigate
cd $BUILD_DIR/opt/frigate
#${BUILD_DIR}/bin/python.sh -u -m frigate --help
mkdir -p /var/snap/frigate/current
$BUILD_DIR/bin/ffmpeg --help
$BUILD_DIR/bin/ffprobe --help
