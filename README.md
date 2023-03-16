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

