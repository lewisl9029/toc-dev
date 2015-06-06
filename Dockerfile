FROM ubuntu:14.04.2

MAINTAINER Lewis Liu

VOLUME /toc

# Set up node environment

WORKDIR /usr/local

RUN apt-get update && \
  apt-get install -y \
    ant \
    build-essential \
    curl \
    git \
    lib32stdc++6 \
    lib32z1 \
    openjdk-7-jdk \
    python \
    ruby \
    xfonts-100dpi \
    xfonts-75dpi \
    xfonts-cyrillic \
    xfonts-scalable \
    xvfb && \
  apt-get clean && \
  rm -rf /tmp/* /var/tmp/* && \
  gem install \
    scss-lint -v 0.38.0

ENV TOC_BUNDLE_FOLDER=bundle \
  TOC_CHROME_BUNDLE_NAME=google-chrome-stable_current_amd64.deb \
  TOC_NODE_BUNDLE_NAME=node-v0.12.4-linux-x64.tar.gz \
  TOC_ANDROID_BUNDLE_NAME=android-sdk_r24.2-linux.tgz \
  TOC_BUNDLE_PATH=/usr/local/toc-bundle \
  TOC_PLATFORMS_BUNDLE_NAME=toc-platforms.tar.gz \
  TOC_PLUGINS_BUNDLE_NAME=toc-plugins.tar.gz \
  TOC_ENGINE_BUNDLE_NAME=toc-engine.tar.gz \
  DISPLAY=:1 \
  ANDROID_HOME=/usr/local/android-sdk-linux \
  PATH=$PATH:/usr/local/android-sdk-linux/tools:/usr/local/android-sdk-linux/platform-tools

COPY $TOC_BUNDLE_FOLDER /usr/local/

RUN dpkg -i $TOC_CHROME_BUNDLE_NAME; \
  apt-get -y -f install && apt-get clean && rm $TOC_CHROME_BUNDLE_NAME && \
  tar -xzf $TOC_NODE_BUNDLE_NAME --strip-components=1 --exclude='ChangeLog' \
    --exclude='LICENSE' --exclude='README.md' && rm $TOC_NODE_BUNDLE_NAME && \
  tar -xzf $TOC_ANDROID_BUNDLE_NAME && rm $TOC_ANDROID_BUNDLE_NAME && \
  echo "y" | android update sdk --no-ui --all -t build-tools-22.0.1 && \
  echo "y" | android update sdk --no-ui --all -t platform-tools && \
  echo "y" | android update sdk --no-ui --all -t tools && \
  echo "y" | android update sdk --no-ui --all -t android-21 && \
  mkdir -p $TOC_BUNDLE_PATH && \
  tar -xzf $TOC_PLATFORMS_BUNDLE_NAME -C $TOC_BUNDLE_PATH && \
  rm $TOC_PLATFORMS_BUNDLE_NAME && \
  tar -xzf $TOC_PLUGINS_BUNDLE_NAME -C $TOC_BUNDLE_PATH && \
  rm $TOC_PLUGINS_BUNDLE_NAME && \
  tar -xzf $TOC_ENGINE_BUNDLE_NAME -C $TOC_BUNDLE_PATH && \
  rm $TOC_ENGINE_BUNDLE_NAME

RUN npm install -g n && npm cache clean && \
  n 0.12.4 && \
  npm install -g cordova@5.0.0 && \
  npm install -g gulp-cli@0.2.0 && \
  npm install -g http-server@0.8.0 && \
  npm install -g ionic@1.5.0 && \
  npm install -g jspm@0.16.0-beta && \
  npm install -g karma-cli@0.0.4 && \
  npm install -g protractor@2.1.0 && \
  npm cache clean && \
  webdriver-manager update

# Expose ionic serve, livereload, karma server ports
EXPOSE 8100 8101 8102

WORKDIR /toc
