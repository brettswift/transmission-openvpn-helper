#!/bin/bash

# this script is called by other scripts

#container_id=$(docker ps -lq)
container_id=$(docker ps  | grep haugene | grep dumb-init | awk '{ print $1 } ')
echo "$container_id"
exit 0
