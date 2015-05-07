#!/usr/bin/env bash
# TOC_VER="$(git -C $TOC_ENV_PATH describe --tags --abbrev=0)"

# sudo docker build \
  # -t toc-dev:$TOC_VER $TOC_ENV_PATH/.build

TOC_BUNDLE_FOLDER=bundle

TOC_CHROME_BUNDLE_NAME=google-chrome-stable_current_amd64.deb
if [ ! -f $TOC_ENV_PATH/$TOC_BUNDLE_FOLDER/$TOC_CHROME_BUNDLE_NAME ]; then
  curl -o $TOC_ENV_PATH/$TOC_BUNDLE_FOLDER/$TOC_CHROME_BUNDLE_NAME \
    https://dl.google.com/linux/direct/$TOC_CHROME_BUNDLE_NAME --create-dirs -sS
fi

TOC_NODE_BUNDLE_NAME=node-v0.12.2-linux-x64.tar.gz
if [ ! -f $TOC_ENV_PATH/$TOC_BUNDLE_FOLDER/$TOC_NODE_BUNDLE_NAME ]; then
  curl -o $TOC_ENV_PATH/$TOC_BUNDLE_FOLDER/$TOC_NODE_BUNDLE_NAME \
    http://nodejs.org/dist/v0.12.2/$TOC_NODE_BUNDLE_NAME --create-dirs -sS
fi

TOC_ANDROID_BUNDLE_NAME=android-sdk_r24.2-linux.tgz
if [ ! -f $TOC_ENV_PATH/$TOC_BUNDLE_FOLDER/$TOC_ANDROID_BUNDLE_NAME ]; then
  curl -o $TOC_ENV_PATH/$TOC_BUNDLE_FOLDER/$TOC_ANDROID_BUNDLE_NAME \
    https://dl.google.com/android/$TOC_ANDROID_BUNDLE_NAME --create-dirs -sS
fi

TOC_BUNDLE_PATH=https://dl.dropboxusercontent.com/u/172349/toc-bundle

TOC_PLATFORMS_BUNDLE_NAME=toc-platforms.tar.gz
if [ ! -f $TOC_ENV_PATH/$TOC_BUNDLE_FOLDER/$TOC_PLATFORMS_BUNDLE_NAME ]; then
  curl -o $TOC_ENV_PATH/$TOC_BUNDLE_FOLDER/$TOC_PLATFORMS_BUNDLE_NAME \
    $TOC_BUNDLE_PATH/$TOC_PLATFORMS_BUNDLE_NAME --create-dirs -sS
fi

TOC_PLUGINS_BUNDLE_NAME=toc-plugins.tar.gz
if [ ! -f $TOC_ENV_PATH/$TOC_BUNDLE_FOLDER/$TOC_PLUGINS_BUNDLE_NAME ]; then
  curl -o $TOC_ENV_PATH/$TOC_BUNDLE_FOLDER/$TOC_PLUGINS_BUNDLE_NAME \
    $TOC_BUNDLE_PATH/$TOC_PLUGINS_BUNDLE_NAME --create-dirs -sS
fi

TOC_ENGINE_BUNDLE_NAME=toc-engine.tar.gz
if [ ! -f $TOC_ENV_PATH/$TOC_BUNDLE_FOLDER/$TOC_ENGINE_BUNDLE_NAME ]; then
  curl -o $TOC_ENV_PATH/$TOC_BUNDLE_FOLDER/$TOC_ENGINE_BUNDLE_NAME \
    $TOC_BUNDLE_PATH/$TOC_ENGINE_BUNDLE_NAME --create-dirs -sS
fi

sudo docker build \
  -t toc-dev:latest $TOC_ENV_PATH/
