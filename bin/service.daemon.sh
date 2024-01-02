#!/bin/bash -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )
exec ${DIR}/frigate/bin/frigate.sh -g /var/snap/frigate/current/config/frigate --no-auth -f --log-level=debug
