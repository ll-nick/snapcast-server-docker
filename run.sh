#!/bin/bash

docker run \
 --name=snapcast-server \
 --restart=unless-stopped \
 --volume /tmp/audio-output:/tmp \
 -p 1704:1704 -p 1705:1705 -p 1780:1780 \
 --volume /home/pi/jukebox/snapcast-server-docker/snapserver.conf:/etc/snapserver.conf \
 --detach \
 nickll/snapcast-server:raspbian
