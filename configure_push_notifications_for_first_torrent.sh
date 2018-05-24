#!/bin/bash

# Source Configuration to bring in environment variables. 
. ./load_config.sh

# Copy files into the existing mount so we can run the slack hook.
cp ./load_config.sh ./$TRANSMISSION_HOME
cp push_notification.sh ./$TRANSMISSION_HOME

container_id=$(./get_container_id_of_transmission.sh)
docker exec -it $container_id transmission-remote -t 1 --torrent-done-script /data/push_notification.sh
