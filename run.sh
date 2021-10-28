#!/bin/bash

docker run \
 --restart=unless-stopped \
 --volume /tmp/audio-output:/tmp \
 -p 1704:1704 -p 1705:1705 -p 1780:1780 \
 --detach \
 nickll/snapcast-server:raspbian
