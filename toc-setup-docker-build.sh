#!/usr/bin/env bash
mkdir -p $TOC_ENV_PATH/cache/bundle
TOC_BUNDLE_FOLDER=$TOC_ENV_PATH/cache/bundle

/bin/bash $TOC_ENV_PATH/toc-setup-bundle.sh $TOC_BUNDLE_FOLDER

sudo docker build \
  -t lewisl9029/toc-dev:latest $TOC_ENV_PATH/
