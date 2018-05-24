#!/bin/bash
#set -x
export container_id=$(./get_container_id_of_transmission.sh)

watch -n10  'echo type ctrl-c to exit; docker exec -it $container_id transmission-remote -t 2 -f ;echo "----"; docker exec -it $container_id transmission-remote -l'
