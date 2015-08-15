#!/usr/bin/env bash
DOCKER_VERSION=1.8.1

if ! dpkg -s docker-engine | grep -q Version.*$DOCKER_VERSION; then
  sudo apt-get update \
    && sudo apt-get install -y \
      curl

  curl -sSL https://get.docker.com/ |
    sed -r 's/^apt-get install -y -q docker-engine$/apt-get install -y -q docker-engine@$DOCKER_VERSION/g' | sh
fi
