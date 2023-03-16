#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
SAVE_FILE=/home/cvision/$DATE.mp4

./configure.sh /dev/video0
./configure.sh /dev/video1
gst-launch-1.0 \
v4l2src device="/dev/video0" extra-controls="c,exposure_auto=1,gain_auto=1"\
    ! 'video/x-raw,format=BGRx' \
    ! nvvidconv \
    ! 'video/x-raw(memory:NVMM),format=RGBA' \
    ! stereo. \
v4l2src device="/dev/video1" extra-controls="c,exposure_auto=1,gain_auto=1"\
    ! 'video/x-raw,format=BGRx' \
    ! nvvidconv \
    ! 'video/x-raw(memory:NVMM),format=RGBA' \
    ! stereo. \
nvcompositor name=stereo \
    sink_0::width=1452 sink_1::width=1452 \
    sink_0::height=912 sink_1::height=912 \
    sink_0::xpos=0 sink_1::xpos=0 \
    sink_0::ypos=0 sink_1::ypos=912 \
    ! nvvidconv \
    ! 'video/x-raw(memory:NVMM),format=NV12' \
    ! nvv4l2h264enc maxperf-enable=1 bitrate=8000000 \
    ! avimux \
    ! filesink location=/home/cvision/test.avi
