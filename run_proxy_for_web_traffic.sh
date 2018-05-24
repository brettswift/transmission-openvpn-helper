#!/bin/bash

container_id=$(./get_container_id_of_transmission.sh)

docker run -d \
      --link $container_id:transmission \
      -p 8080:8080 \
      haugene/transmission-openvpn-proxy

