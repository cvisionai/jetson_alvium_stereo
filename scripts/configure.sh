v4l2-ctl --set-ctrl=exposure_auto_max=1000000 --device=$1
v4l2-ctl --set-ctrl=exposure_active_line_mode=0 --device=$1
v4l2-ctl --set-ctrl=exposure_active_line_selector=0 --device=$1
v4l2-ctl --set-ctrl=trigger_mode=1 --device=$1
v4l2-ctl --set-ctrl=trigger_source=0 --device=$1
v4l2-ctl --set-ctrl=trigger_activation=0 --device=$1
v4l2-ctl --set-ctrl=exposure_active_line_mode=1 --device=$1
