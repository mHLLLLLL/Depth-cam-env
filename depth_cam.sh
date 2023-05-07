sudo apt install -y libgflags-dev  ros-$ROS_DISTRO-image-geometry ros-$ROS_DISTRO-camera-info-manager ros-$ROS_DISTRO-image-transport ros-$ROS_DISTRO-image-publisher libgoogle-glog-dev libusb-1.0-0-dev libeigen3-dev
#复制到home

mkdir -p ~/ros_ws/src
sudo mv libuvc ~/libuvc
sudo mv ros_astra_camera ~/ros_ws/src/
cd ~
cd libuvc
mkdir build && sudo chmod -R 777 build && cd build
cmake .. && make -j8
sudo make install
sudo ldconfig
cd ~
cd ~/ros_ws
catkin_make
echo "source ~/ros_ws/devel/setup.bash"  >> ~/.bashrc 
source ~/.bashrc 
roscd astra_camera
./scripts/create_udev_rules
sudo udevadm control --reload && sudo  udevadm trigger
