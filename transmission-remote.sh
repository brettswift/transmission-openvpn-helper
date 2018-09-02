#!/usr/bin/env bash

# Run transmission remote propagating all cli args. Should behave as if installed locally.

# IE: try:  ./transmission-remote.sh -h
docker exec -it `./get_container_id_of_transmission.sh` transmission-remote "$@"
