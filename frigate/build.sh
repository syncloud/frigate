#!/bin/sh -ex

DIR=$( cd "$( dirname "$0" )" && pwd )
cd ${DIR}
VERSION=$1
BUILD_DIR=${DIR}/../build/snap/frigate
mkdir $BUILD_DIR
cd /opt/frigate
sed -i 's#CONFIG_DIR = "/config"#CONFIG_DIR = "/var/snap/frigate/current/config/frigate"#g' frigate/const.py 
cp -r /opt ${BUILD_DIR}
cp -r /usr ${BUILD_DIR}
cp -r /bin ${BUILD_DIR}
cp -r /lib ${BUILD_DIR}
cp -r ${DIR}/bin/* ${BUILD_DIR}/bin
