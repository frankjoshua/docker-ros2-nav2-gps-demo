FROM frankjoshua/ros2

# ** [Optional] Uncomment this section to install additional packages. **
#
# USER root
# ENV DEBIAN_FRONTEND=noninteractive
# RUN apt-get update \
#    && apt-get -y install --no-install-recommends ros-galactic-desktop \
#    #
#    # Clean up
#    && apt-get autoremove -y \
#    && apt-get clean -y \
#    && rm -rf /var/lib/apt/lists/*
# ENV DEBIAN_FRONTEND=dialog


USER root
WORKDIR /root
COPY ros2_ws ros2_ws
RUN cd ros2_ws && . install/setup.sh && colcon build

COPY ros_entrypoint.sh /ros_entrypoint.sh
RUN chmod +x /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]

CMD [ "/bin/bash", "-i", "-c", "ros2 run example_pkg example_node"]