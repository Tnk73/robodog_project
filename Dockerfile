# 1行目を、PC・ラズパイ両方に対応している公式イメージに変更します
FROM ros:humble-ros-base

# 必要なソフト（PC用のデスクトップ機能やGazeboもここにまとめます）
FROM ros:humble-ros-base

# 共通で必要な最低限のツールをインストール
RUN apt-get update && apt-get install -y \
    python3-pip \
    nano \
    && rm -rf /var/lib/apt/lists/*

# パソコン(x86_64)かラズパイ(aarch64)かを自動判定し、PCの時だけGazeboなどを入れる
RUN apt-get update && \
    ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then \
        echo "PC detected. Installing Desktop and Gazebo..."; \
        apt-get install -y ros-humble-desktop ros-humble-gazebo-ros-pkgs ros-humble-xacro; \
    else \
        echo "Raspberry Pi detected. Skipping Desktop and Gazebo..."; \
    fi && \
    rm -rf /var/lib/apt/lists/*

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
WORKDIR /ros2_ws