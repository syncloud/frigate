#!/bin/bash -xe
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )
LIBS=$(echo ${DIR}/lib/*-linux-gnu*)
LIBS=$LIBS:$(echo ${DIR}/usr/lib/*-linux-gnu*)
LIBS=$LIBS:$(echo ${DIR}/usr/lib)
LIBS=$LIBS:$(echo ${DIR}/usr/local/lib)
export CONFIG_FILE=/var/snap/frigate/current/config/frigate/config.yaml
${DIR}/lib/*-linux*/ld-*.so.* --library-path $LIBS ${DIR}/usr/bin/python3.* "$@"
