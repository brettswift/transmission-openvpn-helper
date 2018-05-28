#!/bin/bash
#set -x

# Source environment variables from config
. ./load_config.sh

mkdir -p ./$TRANSMISSION_HOME/watch

ENV_PASS="${VPN_PASSWORD:-UNSET}"

if [ $ENV_PASS = "UNSET" ]; then 
   echo -n Password for ${OPENVPN_USERNAME} at ${OPENVPN_PROVIDER}: 
   read -s password
   echo
else
   password=$VPN_PASSWORD
fi

echo "Starting Docker container"

OPENVPN_PASSWORD=$password
LOCAL_STORAGE_PATH="$PWD"/${TRANSMISSION_HOME}

# Docker won't let you mount /etc.  So lets work around that. 
cp /etc/localtime .timezone
TIME_ZONE_PATH="$PWD"/.timezone
# TIME_ZONE_PATH=/etc/localtime

set -x

# See transmission-openvpn docs for usage
# transmission settings.json args can be passed in here, prefixed wtih TRANSMISSION_, and all upper case with dashes converted to underscores

docker run --cap-add=NET_ADMIN --device=/dev/net/tun -d \
              -v ${LOCAL_STORAGE_PATH}:/data \
              -v ${TIME_ZONE_PATH}:/etc/localtime:ro \
              -e LOCAL_NETWORK=192.168.0.0/24 \
              -e "OPENVPN_PROVIDER=${OPENVPN_PROVIDER}" \
              -e "OPENVPN_USERNAME=${OPENVPN_USERNAME}" \
              -e "OPENVPN_PASSWORD=${OPENVPN_PASSWORD}" \
              -e TRANSMISSION_WATCH_DIR="/data/watch" \
              -e TRANSMISSION_WATCH_DIR_ENABLED=true \
              -e TRANSMISSION_SCRIPT_TORRENT_DONE_ENABLED=true \
              --dns 8.8.8.8 --dns 8.8.4.4 \
              -p 9091:9091 \
              haugene/transmission-openvpn


              #-e "OPENVPN_CONFIG=${OPENVPN_CONFIG}" \
#              -e "LOCAL_NETWORK=192.168.0.0/24" \

echo "Transmission is now running! run 'docker ps' to see.. "
