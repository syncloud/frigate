#!/bin/sh -ex

DIR=$( cd "$( dirname "$0" )" && pwd )
cd ${DIR}
BUILD_DIR=${DIR}/../build/snap/frigate
mkdir $BUILD_DIR
cd /opt/frigate
cp -r /opt ${BUILD_DIR}
cp -r /usr ${BUILD_DIR}
cp -r /bin ${BUILD_DIR}
cp -r /lib ${BUILD_DIR}
cp -r /*.txt ${BUILD_DIR}
cp -r /*.tflite ${BUILD_DIR}
cp -r /openvino-model ${BUILD_DIR}
cp -r /usr/lib/btbn-ffmpeg/bin/* ${BUILD_DIR}/usr/bin || true
curl -o ${BUILD_DIR}/black.mp4 https://user-images.githubusercontent.com/362089/178692766-3a394ad7-e027-48cb-b2c3-1c6d7be2370e.mp4
cp -r ${DIR}/bin/* ${BUILD_DIR}/bin
