#!/bin/bash
set -x
export container_id=$(./get_container_id_of_transmission.sh)
watch -n10  'docker exec -it $container_id transmission-remote -t 1 -f ;echo "----"; docker exec -it $container_id transmission-remote -l'
