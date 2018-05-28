#!/bin/bash
#set -x
export container_id=$(./get_container_id_of_transmission.sh)


die () {
    echo "current torrents: " 
    docker exec -it `./get_container_id_of_transmission.sh` transmission-remote --list
    echo " " 
    echo "Select from the torrents in the above list"  
    echo >&2 "$@"

    exit 1
}

[ "$#" -eq 1 ] || die "1 argument required - torrent ID - , $# provided"
echo $1 | grep -E -q '^[0-9]+$' || die "Numeric argument required, $1 provided"

TORRENT_ID=$1


watch -n10  "echo type ctrl-c to exit; docker exec -it $container_id transmission-remote -t ${TORRENT_ID} -f ;echo '----'; docker exec -it $container_id transmission-remote -l"
