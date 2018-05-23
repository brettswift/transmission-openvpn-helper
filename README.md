# Getting Started

This project will run a docker image that will log you into a VPN account and download torrents for you. 

It contains: 

* config file
* script to start a docker image
* scripts to inspect the status of your torrents & debug.

# Pre Requisits

## Install docker

yes. do it.

## Create a Config file

1. Copy `conf.ipvanish` to `conf`.
2. update the values in in the `conf` file according to your setup. 

Other VPN's might require different configuration.

If you need to add new configurations, be sure the `./start_transmission_image.sh` script uses the values in the docker run command.

# Running

## Start the image

`./start_transmission_image.sh`

## Drop files into the watch folder

By default it is "./transmission/watch",  but the root folder "transmission" may be changed by a configuration in the `conf` file.

## Monitor the torrents

`./show_torrent_status.sh`

## Known Issues

Transmission is supposed to watch the watch folder.   I find that sometimes it doesn't pick up torrents very quickly.

If you want it to pick up a torrent right away, just kill the image and restart it. 

This will help you: 

```
docker kill `./get_container_id_of_transmission.sh`
./start_transmission_image.sh

```

# Contributing

See the .github folder in the repo.  They contain templates you will see when you create a Pull Request or issue on github.