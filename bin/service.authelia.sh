#!/bin/bash -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )
exec ${DIR}/authelia/bin/authelia.sh --config /var/snap/frigate/current/config/authelia/config.yml
