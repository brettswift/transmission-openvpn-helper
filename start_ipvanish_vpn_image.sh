#!/bin/bash
#set -x

mkdir -p ./downloads/watch

ENV_PASS="${VPN_PASSWORD:-UNSET}"

if [ $ENV_PASS = "UNSET" ]; then 
   echo -n Password: 
   read -s password
   echo
else
   password=$VPN_PASSWORD
fi

echo $password
echo "Starting Docker container"
OPENVPN_PROVIDER=IPVANISH
OPENVPN_USERNAME=brettswift@gmail.com
OPENVPN_PASSWORD=$password
OPENVPN_CONFIG=ipvanish-CA-Vancouver-yvr-c02
LOCAL_STORAGE_PATH=/Users/bswift/torrents/downloads/

set -x
docker run --cap-add=NET_ADMIN --device=/dev/net/tun -d \
              -v ${LOCAL_STORAGE_PATH}:/data \
              -v /etc/localtime:/etc/localtime:ro \
              -e "OPENVPN_PROVIDER=${OPENVPN_PROVIDER}" \
              -e "OPENVPN_USERNAME=${OPENVPN_USERNAME}" \
              -e "OPENVPN_PASSWORD=${OPENVPN_PASSWORD}" \
              --dns 8.8.8.8 --dns 8.8.4.4 \
              -p 9091:9091 \
              haugene/transmission-openvpn

              #-e "LOCAL_NETWORK=192.168.0.0/24" \

              #-e "OPENVPN_CONFIG=${OPENVPN_CONFIG}" \
