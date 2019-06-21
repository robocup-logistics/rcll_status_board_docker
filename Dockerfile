FROM ubuntu:bionic

# Some basic configuration and information
MAINTAINER Florian Eith

RUN apt-get -y update

# install refbox dependencies
RUN apt-get -y install software-properties-common nano
RUN add-apt-repository -y ppa:timn/clips
RUN apt-get update
RUN apt-get -y install libboost-all-dev clips git libavahi-client-dev libclips-dev libclipsmm-dev libgecode-dev libglibmm-2.4-dev libgtkmm-3.0-dev libmodbus-dev libmongoclient-dev libncurses5-dev libncursesw5-dev libprotobuf-dev libprotoc-dev libssl-dev libyaml-cpp-dev protobuf-compiler

# install refbox
WORKDIR /root
RUN git clone https://github.com/robocup-logistics/rcll-refbox.git
WORKDIR /root/rcll-refbox
RUN make

# install ROS dependencies
WORKDIR /root
ENV DEBIAN_FRONTEND=noninteractive
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt update
RUN apt install -y ros-melodic-ros-base
RUN apt-get -y install libopencv-dev

# Setup internal catkin_ws folder
RUN mkdir -p /root/catkin_ws/src

# download visualization packages
WORKDIR /root/catkin_ws/src
RUN git clone https://github.com/ethflo/protobuf_comm.git
RUN git clone https://github.com/ethflo/llsf_msgs.git
RUN git clone https://github.com/ethflo/rcll_vis_msgs
RUN git clone https://github.com/ethflo/rcll_status_board
WORKDIR /root/catkin_ws/src/llsf_msgs
RUN git checkout dockerized
WORKDIR /root/catkin_ws/src/rcll_status_board
RUN git checkout dockerized
WORKDIR /root/catkin_ws/src

# -----------#
# Entrypoint #
# -----------#

COPY docker-entrypoint.sh /usr/local/bin/
RUN ["chmod", "+x", "/usr/local/bin/docker-entrypoint.sh"]
ENTRYPOINT ["docker-entrypoint.sh"]
