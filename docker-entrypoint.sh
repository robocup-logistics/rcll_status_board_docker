#!/bin/bash

source /opt/ros/melodic/setup.bash
cd /root/catkin_ws
catkin_make
source /root/catkin_ws/devel/setup.bash
roslaunch rcll_status_board all.launch screen_x:=1920 screen_y:=1080
