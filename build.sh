#!/bin/bash

docker build --pull -t nickll/snapcast-server:raspbian --build-arg BUILD_FROM=balenalib/rpi-raspbian:latest .
