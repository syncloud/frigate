#!/bin/bash -ex

DIR=$( cd "$( dirname "$0" )" && pwd )
cd ${DIR}
APP=$1
VERSION=$2
VOD_VERSION=1.32

SNAP_DIR=${DIR}/../build/snap
apt update
apt install -y build-essential gcc wget libpcre3-dev libssl-dev zlib1g-dev
wget https://github.com/kaltura/nginx-vod-module/archive/refs/tags/$VOD_VERSION.tar.gz
tar xf $VOD_VERSION.tar.gz
ls -la ${DIR}/nginx-vod-module-$VOD_VERSION

wget http://nginx.org/download/nginx-$VERSION.tar.gz
tar xf nginx-$VERSION.tar.gz
cd nginx-$VERSION
PREFIX=/snap/$APP/current/nginx
./configure \
  --add-module=${DIR}/nginx-vod-module-$VOD_VERSION \
  --prefix=$PREFIX \
  --with-compat \
  --with-file-aio \
  --with-threads \
  --with-http_addition_module \
  --with-http_auth_request_module \
  --with-http_dav_module \
  --with-http_flv_module \
  --with-http_gunzip_module \
  --with-http_gzip_static_module \
  --with-http_mp4_module \
  --with-http_random_index_module \
  --with-http_realip_module \
  --with-http_secure_link_module \
  --with-http_slice_module \
  --with-http_ssl_module \
  --with-http_stub_status_module \
  --with-http_sub_module \
  --with-http_v2_module \
  --with-mail \
  --with-mail_ssl_module \
  --with-stream \
  --with-stream_realip_module \
  --with-stream_ssl_module \
  --with-stream_ssl_preread_module
#  --with-cc-opt='-g -O2 -ffile-prefix-map=/data/builder/debuild/nginx-1.24.0/debian/debuild-base/nginx-1.24.0=. -fstack-protector-strong -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fPIC' \
#  --with-ld-opt='-Wl,-z,relro -Wl,-z,now -Wl,--as-needed -pie'
make
make install
apt remove --purge -y build-essential gcc wget
mkdir -p $SNAP_DIR
cp -r $PREFIX $SNAP_DIR
cp -r /lib $SNAP_DIR/nginx
cp -r /usr/lib $SNAP_DIR/nginx
mkdir $SNAP_DIR/nginx/bin
cp ${DIR}/nginx.sh $SNAP_DIR/nginx/bin
