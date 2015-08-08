#!/usr/bin/env bash
cd $TOC_ENV_PATH

mkdir -p $TOC_ENV_PATH/cache/bundle
TOC_BUNDLE_FOLDER=$TOC_ENV_PATH/cache/bundle
cd $TOC_BUNDLE_FOLDER

source $TOC_ENV_PATH/toc-setup-bundle.sh

sudo docker build \
  -t toc-dev:latest $TOC_ENV_PATH/
