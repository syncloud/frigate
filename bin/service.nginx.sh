#!/bin/bash -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )

/bin/rm -f /var/snap/frigate/common/web.socket
exec ${DIR}/frigate/bin/nginx.sh -c /var/snap/frigate/current/config/nginx.conf -p ${DIR}/nginx -e stderr
