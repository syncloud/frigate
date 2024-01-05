#!/bin/bash -e
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )
cd ${DIR}/frigate/opt/frigate
exec ${DIR}/frigate/bin/python.sh -u -m frigate
