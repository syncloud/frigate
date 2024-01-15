#!/bin/bash -e
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )
cd ${DIR}/frigate/opt/frigate
export CONFIG_FILE=/var/snap/frigate/current/config/frigate/config.yaml
export PATH=$PATH:${DIR}/frigate/bin
exec ${DIR}/frigate/bin/python.sh -u -m frigate
