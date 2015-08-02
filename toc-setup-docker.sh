#!/usr/bin/env bash
DOCKER_VERSION=1.7.1

if ! dpkg -s lxc-docker | grep -q Version.*$DOCKER_VERSION; then
  echo deb https://get.docker.com/ubuntu docker main \
    | sudo tee /etc/apt/sources.list.d/docker.list
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
    --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

  sudo apt-get update \
    && sudo apt-get install -y \
      curl \
      lxc-docker=$DOCKER_VERSION \
    && sudo apt-get clean \
    && sudo rm -rf /tmp/* /var/tmp/*
fi
