#!/bin/bash

container_id=$(docker ps -lq)

watch -n10  docker exec -it $container_id transmission-remote -l
