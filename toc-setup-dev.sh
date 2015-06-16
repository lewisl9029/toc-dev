#!/usr/bin/env bash
cd $TOC_ENV_PATH

TOC_BUNDLE_FOLDER=bundle
cd $TOC_BUNDLE_FOLDER

source toc-setup-bundle.sh

sudo docker build \
  -t toc-dev:latest $TOC_ENV_PATH/
