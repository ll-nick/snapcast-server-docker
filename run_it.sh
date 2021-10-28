#!/bin/bash

docker run \
 --rm \
 --user root \
 -it \
 -v /tmp/audio-output:/tmp \
 -p 1704:1704 -p 1705:1705 -p 1780:1780 \
 nickll/snapcast-server:raspbian
