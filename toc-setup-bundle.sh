#!/usr/bin/env bash
TOC_CHROME_BUNDLE_NAME=google-chrome-stable_current_amd64.deb
if [ ! -f $TOC_CHROME_BUNDLE_NAME ]; then
  curl -o $TOC_CHROME_BUNDLE_NAME \
    https://dl.google.com/linux/direct/$TOC_CHROME_BUNDLE_NAME --create-dirs -sS
fi

TOC_NODE_BUNDLE_NAME=node-v0.12.7-linux-x64.tar.gz
if [ ! -f $TOC_NODE_BUNDLE_NAME ]; then
  curl -o $TOC_NODE_BUNDLE_NAME \
    http://nodejs.org/dist/v0.12.7/$TOC_NODE_BUNDLE_NAME --create-dirs -sS
fi

TOC_ANDROID_BUNDLE_NAME=android-sdk_r24.2-linux.tgz
if [ ! -f $TOC_ANDROID_BUNDLE_NAME ]; then
  curl -o $TOC_ANDROID_BUNDLE_NAME \
    https://dl.google.com/android/$TOC_ANDROID_BUNDLE_NAME --create-dirs -sS
fi

TOC_REMOTE_BUNDLE_PATH=https://dl.dropboxusercontent.com/u/172349/toc-bundle

TOC_PLATFORMS_BUNDLE_NAME=toc-platforms.tar.gz
if [ ! -f $TOC_PLATFORMS_BUNDLE_NAME ]; then
  curl -o $TOC_PLATFORMS_BUNDLE_NAME \
    $TOC_REMOTE_BUNDLE_PATH/$TOC_PLATFORMS_BUNDLE_NAME --create-dirs -sS
fi

TOC_PLUGINS_BUNDLE_NAME=toc-plugins.tar.gz
if [ ! -f $TOC_PLUGINS_BUNDLE_NAME ]; then
  curl -o $TOC_PLUGINS_BUNDLE_NAME \
    $TOC_REMOTE_BUNDLE_PATH/$TOC_PLUGINS_BUNDLE_NAME --create-dirs -sS
fi

TOC_ENGINE_BUNDLE_NAME=toc-engine.tar.gz
if [ ! -f $TOC_ENGINE_BUNDLE_NAME ]; then
  curl -o $TOC_ENGINE_BUNDLE_NAME \
    $TOC_REMOTE_BUNDLE_PATH/$TOC_ENGINE_BUNDLE_NAME --create-dirs -sS
fi
