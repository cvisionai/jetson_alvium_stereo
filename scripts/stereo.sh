#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
SAVE_FILE=/home/cvision/$DATE.mp4

./configure.sh /dev/video0
./configure.sh /dev/video1
gst-launch-1.0 \
v4l2src device="/dev/video0" extra-controls="c,exposure_auto=1,gain_auto=1"\
    ! 'video/x-raw,format=BGRx' \
    ! nvvidconv \
    ! queue \
    ! 'video/x-raw(memory:NVMM),format=RGBA' \
    ! stereo. \
v4l2src device="/dev/video1" extra-controls="c,exposure_auto=1,gain_auto=1"\
    ! 'video/x-raw,format=BGRx' \
    ! nvvidconv \
    ! queue \
    ! 'video/x-raw(memory:NVMM),format=RGBA' \
    ! stereo. \
nvcompositor name=stereo \
    sink_0::width=960 sink_1::width=960 \
    sink_0::height=600 sink_1::height=600 \
    sink_0::xpos=0 sink_1::xpos=0 \
    sink_0::ypos=0 sink_1::ypos=600 \
    ! nvvidconv \
    ! queue \
    ! 'video/x-raw(memory:NVMM),format=NV12' \
    ! nvv4l2h264enc maxperf-enable=1 bitrate=8000000 \
    ! splitmuxsink muxer=avimux max-size-time=900000000000 location=/home/cvision/test_%05d.avi
