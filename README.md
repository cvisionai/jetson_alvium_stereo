# Hardware setup
* 1 Jetson Nano Developer Kit
* 2 Allied Adapter board for NVIDIA Jetson Nano Developer Kit
* 2 Alvium MIPI CSI-2 Cameras

# Board bringup

* Install JetPack 4.6.1 (use exactly this version) by flashing the SD card (don't bother with SDK manager)
* Get the drivers from github
```
wget https://github.com/alliedvision/linux_nvidia_jetson/releases/download/l4t-32.7.1-4.0.0/AlliedVision_NVidia_nano_L4T_32.7.1_4.0.0.gc3fa7ac49.tar.gz -O ~/AlliedVision_NVidia_nano_L4T_32.7.1_4.0.0.gc3fa7ac49.tar.gz
cd ~
tar xvf AlliedVision_NVidia_nano_L4T_32.7.1_4.0.0.gc3fa7ac49.tar.gz
cd AlliedVision_NVidia_nano_L4T_32.7.1_4.0.0.gc3fa7ac49
AlliedVision_NVidia_nano_L4T_32.7.1_4.0.0.gc3fa7ac49
./install.sh # Enter prompt info as needed
sudo reboot
```
* Install apt packages:
```
sudo apt install v4l-utils
```
* To get a list of available v4l2 controls:
```
v4l2-ctl --list-ctrls --device /dev/video0
```
* Install the Jetson GPIO package:
```
pip3 install Jetson.GPIO
sudo groupadd -f -r gpio
sudo usermod -aG gpio $USER
sudo wget https://raw.githubusercontent.com/NVIDIA/jetson-gpio/master/lib/python/Jetson/GPIO/99-gpio.rules -O /etc/udev/rules.d/99-gpio.rules
```

