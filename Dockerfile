FROM ubuntu:14.04.2

MAINTAINER Lewis Liu

VOLUME /toc
VOLUME /toc-landing

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
    scss_lint -v 0.40.1

ENV TOC_BUNDLE_FOLDER=cache/bundle \
  TOC_CHROME_BUNDLE_NAME=google-chrome-stable_current_amd64.deb \
  TOC_NODE_BUNDLE_NAME=node-v0.12.7-linux-x64.tar.gz \
  TOC_ANDROID_BUNDLE_NAME=android-sdk_r24.2-linux.tgz \
  DISPLAY=:1 \
  ANDROID_HOME=/usr/local/android-sdk-linux \
  PATH=$PATH:/usr/local/android-sdk-linux/tools:/usr/local/android-sdk-linux/platform-tools

COPY $TOC_BUNDLE_FOLDER /usr/local/

ADD toc-setup-bundle.sh /usr/local/toc-setup-bundle.sh
RUN /bin/bash toc-setup-bundle.sh

RUN dpkg -i $TOC_CHROME_BUNDLE_NAME; \
  apt-get -y -f install && apt-get clean && rm $TOC_CHROME_BUNDLE_NAME && \
  tar -xzf $TOC_NODE_BUNDLE_NAME --strip-components=1 --exclude='ChangeLog' \
    --exclude='LICENSE' --exclude='README.md' && rm $TOC_NODE_BUNDLE_NAME && \
  tar -xzf $TOC_ANDROID_BUNDLE_NAME && rm $TOC_ANDROID_BUNDLE_NAME && \
  android list sdk --extended --all && \
  echo "y" | android update sdk --no-ui --all -t build-tools-22.0.1 && \
  echo "y" | android update sdk --no-ui --all -t platform-tools && \
  echo "y" | android update sdk --no-ui --all -t tools && \
  echo "y" | android update sdk --no-ui --all -t android-22

RUN npm install -g npm@3.2.1 && \
  npm install -g cordova@5.1.1 && \
  npm install -g gulp-cli@0.3.0 && \
  npm install -g http-server@0.8.0 && \
  npm install -g jspm-server@0.1.8 && \
  npm install -g ionic@1.6.4 && \
  npm install -g jspm@0.16.0-beta.3 && \
  npm install -g karma-cli@0.1.0 && \
  npm install -g protractor@2.1.0 && \
  npm cache clean && \
  webdriver-manager update

VOLUME /root/.gradle
VOLUME /root/.android

# Expose ionic serve, livereload, karma server ports
EXPOSE 8100 8101 8102 8200 8201

WORKDIR /toc
