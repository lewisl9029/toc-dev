#!/usr/bin/env bash
cd $TOC_ENV_PATH

source toc-setup-bundle.sh

sudo docker build \
  -t toc-dev:latest $TOC_ENV_PATH/
