#!/bin/bash

container_id=$(docker ps -lq)

cp push_notification.sh ./downloads

docker exec -it $container_id transmission-remote -t 1 --torrent-done-script /data/push_notification.sh