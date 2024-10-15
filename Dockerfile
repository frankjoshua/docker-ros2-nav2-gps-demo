FROM frankjoshua/ros2

# ** [Optional] Uncomment this section to install additional packages. **

USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
   && apt-get -y install --no-install-recommends \
   ros-$ROS_DISTRO-desktop ros-$ROS_DISTRO-navigation2 \
   ros-$ROS_DISTRO-nav2-bringup \
   #
   # Clean up
   && apt-get autoremove -y \
   && apt-get clean -y \
   && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog


USER root
WORKDIR /root
COPY ros2_ws ros2_ws

RUN echo "deb http://packages.ros.org/ros2-testing/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-testing.list && sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys F42ED6FBAB17C654
# RUN source /opt/$ROS_DISTRO/setup.sh && rosdep init && rosdep update
RUN cd ros2_ws && apt-get update && rosdep install --from-paths src --ignore-src -r -y && . install/setup.sh && colcon build

COPY ros_entrypoint.sh /ros_entrypoint.sh
RUN chmod +x /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]

CMD [ "/bin/bash", "-i", "-c", "ros2 run example_pkg example_node"]