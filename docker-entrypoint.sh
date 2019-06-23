#!/bin/bash

source /opt/ros/melodic/setup.bash
cd /root/catkin_ws
catkin_make
source /root/catkin_ws/devel/setup.bash

echo "==========================="
echo "Configuration:"
echo $1"="$2
echo $3"="$4
echo $5"="$6
echo $7"="$8
echo "==========================="

roslaunch rcll_status_board all.launch refbox_host:=$2 refbox_remote:=$4 screen_x:=$6 screen_y:=$8
