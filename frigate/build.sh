#!/bin/sh -ex

DIR=$( cd "$( dirname "$0" )" && pwd )
cd ${DIR}
VERSION=$1
BUILD_DIR=${DIR}/../build/snap/frigate
mkdir $BUILD_DIR
cd /opt/frigate
sed -i 's#CONFIG_DIR = "/config"#CONFIG_DIR = "/var/snap/frigate/current/config/frigate"#g' frigate/const.py 
sed -i 's#BASE_DIR = "/media/frigate"#BASE_DIR = "/data/frigate/media"#g' frigate/const.py 
sed -i 's#CACHE_DIR = "/tmp/cache"#CACHE_DIR = "/data/frigate/cache"#g' frigate/const.py
sed -i '1s#^#import multiprocessing \n#' frigate/__main__.py
sed -i '2s#^#multiprocessing.set_start_method("spawn") \n#' frigate/__main__.py
sed -i '3s#^#multiprocessing.set_executable("/snap/frigate/current/frigate/bin/python.sh") \n#' frigate/__main__.py
head frigate/__main__.py
sed -i 's#/opt/frigate/frigate#/snap/frigate/current/frigate/opt/frigate#' frigate/output.py
sed -i 's#/opt/frigate/frigate#/snap/frigate/current/frigate/opt/frigate#' frigate/http.py

#hack fix spawn "TypeError: cannot pickle 'weakref' object"
sed -i 's/self.camera_metrics\[name\]\["process"\] = .*/#/g' frigate/app.py
sed -i 's/self.camera_metrics\[name\]\["capture_process"\] = .*/#/g' frigate/app.py

sed -i 's#host="127.0.0.1", port=5001#host="unix:///var/snap/frigate/current/api.socket"#g' frigate/app.py

grep camera_process frigate/app.py
grep capture_process frigate/app.py

cp -r /opt ${BUILD_DIR}
cp -r /usr ${BUILD_DIR}
cp -r /bin ${BUILD_DIR}
cp -r /lib ${BUILD_DIR}
cp -r /*.txt ${BUILD_DIR}
cp -r /*.tflite ${BUILD_DIR}
cp -r /openvino-model ${BUILD_DIR}
curl -o ${BUILD_DIR}/black.mp4 https://user-images.githubusercontent.com/362089/178692766-3a394ad7-e027-48cb-b2c3-1c6d7be2370e.mp4
cp -r ${DIR}/bin/* ${BUILD_DIR}/bin
