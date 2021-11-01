#!/bin/bash

docker run \
 --name=snapcast-server \
 --rm \
 --user root \
 -it \
 -v /tmp/audio-output:/tmp \
 -v /home/pi/jukebox/snapcast-server-docker/snapserver.conf:/etc/snapserver.conf
 -p 1704:1704 -p 1705:1705 -p 1780:1780 \
 nickll/snapcast-server:raspbian
