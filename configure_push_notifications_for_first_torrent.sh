#!/bin/bash
# set -x

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "1 argument required - torrent ID - , $# provided"
echo $1 | grep -E -q '^[0-9]+$' || die "Numeric argument required, $1 provided"

TORRENT_ID=$1

# Source Configuration to bring in environment variables. 
. ./load_config.sh



# Copy files into the existing mount so we can run the slack hook.
cp ./load_config.sh ./$TRANSMISSION_HOME
cp push_notification.sh ./$TRANSMISSION_HOME

container_id=$(./get_container_id_of_transmission.sh)
docker exec -it $container_id transmission-remote -t $TORRENT_ID --torrent-done-script /data/push_notification.sh
