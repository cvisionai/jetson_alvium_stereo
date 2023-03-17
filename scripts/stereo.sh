#!/bin/bash

#/home/cvision/jetson_alvium_stereo/scripts/configure.sh /dev/video0
#/home/cvision/jetson_alvium_stereo/scripts/configure.sh /dev/video1
v4l2-ctl --set-ctrl=exposure_auto_max=7000000 --device=/dev/video0
v4l2-ctl --set-ctrl=exposure_auto_max=7000000 --device=/dev/video1
gst-launch-1.0 \
v4l2src device="/dev/video0" extra-controls="c,gain_auto=1,exposure_auto=1,auto_white_balance=1" \
    ! 'video/x-raw,format=BGRx' \
    ! nvvidconv \
    ! queue \
    ! 'video/x-raw(memory:NVMM),format=RGBA' \
    ! stereo. \
v4l2src device="/dev/video1" extra-controls="c,gain_auto=1,exposure_auto=1,auto_white_balance=1" \
    ! 'video/x-raw,format=BGRx' \
    ! nvvidconv \
    ! queue \
    ! 'video/x-raw(memory:NVMM),format=RGBA' \
    ! stereo. \
nvcompositor name=stereo \
    sink_0::width=1440 sink_1::width=1440 \
    sink_0::height=900 sink_1::height=900 \
    sink_0::xpos=0 sink_1::xpos=0 \
    sink_0::ypos=0 sink_1::ypos=900 \
    ! nvvidconv \
    ! queue \
    ! 'video/x-raw(memory:NVMM),format=NV12' \
    ! nvv4l2h264enc maxperf-enable=1 bitrate=8000000 \
    ! h264parse \
    ! splitmuxsink muxer=matroskamux max-size-time=3600000000000 location=/home/cvision/test_%05d.mkv
