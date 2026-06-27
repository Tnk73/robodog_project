# 1行目を、PC・ラズパイ両方に対応している公式イメージに変更します
FROM ros:humble-ros-base

# 必要なソフト（PC用のデスクトップ機能やGazeboもここにまとめます）
RUN apt-get update && apt-get install -y \
    python3-pip \
    nano \
    ros-humble-desktop \
    ros-humble-gazebo-ros-pkgs \
    ros-humble-xacro \
    && rm -rf /var/lib/apt/lists/*

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
WORKDIR /ros2_ws