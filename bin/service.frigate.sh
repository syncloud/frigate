#!/bin/bash -e
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )
cd ${DIR}/frigate/opt/frigate
export PATH=$PATH:${DIR}/frigate/bin
exec ${DIR}/frigate/bin/python.sh -u -m frigate
