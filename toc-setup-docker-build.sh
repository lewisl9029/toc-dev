#!/usr/bin/env bash
mkdir -p $TOC_ENV_PATH/cache/bundle
TOC_BUNDLE_FOLDER=$TOC_ENV_PATH/cache/bundle

source $TOC_ENV_PATH/toc-setup-bundle.sh

sudo docker build \
  -t lewisl9029/toc-dev:latest $TOC_ENV_PATH/
