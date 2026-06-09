FROM osrf/ros:humble-desktop

# ここに必要なソフトを追加していきます
RUN apt-get update && apt-get install -y \
    python3-pip \
    nano \
    && rm -rf /var/lib/apt/lists/*

# ROS2のコマンドを最初から使えるようにする設定
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
WORKDIR /ros2_ws