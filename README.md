# ROS2 Nav2 GPS Demo in Docker [![](https://img.shields.io/docker/pulls/frankjoshua/ros2-nav2-gps-demo)](https://hub.docker.com/r/frankjoshua/ros2-nav2-gps-demo) [![CI](https://github.com/frankjoshua/docker-ros2-nav2-gps-demo/workflows/CI/badge.svg)](https://github.com/frankjoshua/docker-ros2-nav2-gps-demo/actions)

## Description

This Docker container runs a ROS2 Nav2 GPS demo. It includes the necessary components for navigation using GPS data in a ROS2 environment. --network="host" is likely needed because ROS uses ephemeral ports. --ipc=host is needed to allow shared memory between processes for DDS when multiple containers are on the same machine. --pid=host is needed for unique GUID in DDS to avoid possible ID conflicts.

This repo demonstrates how to build a multi-architecture Docker container with ROS2 (Robot Operating System 2) and Nav2 with GPS integration. Github Actions is used to build 3 Docker containers using `docker buildx` for amd64 (x86 Desktop PC), arm64 (Jetson Nano), and arm32 (Raspberry Pi). This setup allows for local development on a work PC or laptop, with the ability to transfer your work to an embedded device with a high level of confidence.

## Example

```
docker run -it \
    --network=host \
    --ipc=host \
    --pid=host \
    frankjoshua/ros2-nav2-gps-demo
```

## Building

Use [build.sh](build.sh) to build the Docker containers.

<br>Local builds are as follows:

```
./build.sh -t frankjoshua/ros2-nav2-gps-demo -l
```

## Template

This repo was created from the ros2-master template. The repo name has been changed in [.github/workflows/ci.yml](.github/workflows/ci.yml), and the [Dockerfile](Dockerfile) and [README.md](README.md) have been updated accordingly.

## Testing

Github Actions expects the DOCKERHUB_USERNAME and DOCKERHUB_TOKEN variables to be set in your environment.

## License

Apache 2.0

## Author Information

Joshua Frank [@frankjoshua77](https://www.twitter.com/@frankjoshua77)
<br>
[http://roboticsascode.com](http://roboticsascode.com)
