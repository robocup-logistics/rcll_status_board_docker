#!/bin/bash

source /opt/ros/melodic/setup.bash
cd /root/catkin_ws
catkin_make
source /root/catkin_ws/devel/setup.bash
roslaunch rcll_status_board all.launch refbox_host:=$2 refbox_remote:=$4 screen_x:=$6 screen_y:=$8
