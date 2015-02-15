#!/usr/bin/env bash
# TOC_VER="$(git -C $TOC_ENV_PATH describe --tags --abbrev=0)"

# sudo docker build \
  # -t toc-dev:$TOC_VER $TOC_ENV_PATH/.build
sudo docker build \
  -t toc-dev:latest $TOC_ENV_PATH/
