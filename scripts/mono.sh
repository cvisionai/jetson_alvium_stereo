#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
SAVE_FILE=$HOME/$DATE.avi

./configure.sh /dev/video0
gst-launch-1.0 \
v4l2src device="/dev/video0" extra-controls="c,exposure_auto=1,gain_auto=1"\
    ! video/x-raw,format=BGRx \
    ! nvvidconv \
    ! 'video/x-raw(memory:NVMM),format=NV12' \
    ! nvv4l2h264enc maxperf-enable=1 bitrate=8000000 \
    ! avimux \
    ! filesink location=/home/cvision/test.avi
