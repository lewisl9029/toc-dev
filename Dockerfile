FROM ubuntu:14.04.2

MAINTAINER Lewis Liu

VOLUME /toc

# Set up node environment

WORKDIR /usr/local

RUN apt-get update \
  && apt-get install -y \
    ant=1.9.3-2build1 \
    build-essential=11.6ubuntu6 \
    curl=7.35.0-1ubuntu2.3 \
    git=1:1.9.1-1 \
    lib32stdc++6=4.8.2-19ubuntu1 \
    lib32z1=1:1.2.8.dfsg-1ubuntu1 \
    openjdk-7-jdk=7u79-2.5.5-0ubuntu0.14.04.2 \
    python=2.7.5-5ubuntu3 \
    ruby=1:1.9.3.4 \
    xfonts-100dpi=1:1.0.3 \
    xfonts-75dpi=1:1.0.3 \
    xfonts-cyrillic=1:1.0.3 \
    xfonts-scalable=1:1.0.3-1 \
    xvfb=2:1.15.1-0ubuntu2.7 \
  && apt-get clean \
  && rm -rf /tmp/* /var/tmp/*

RUN gem install \
  scss-lint -v 0.37.0

ENV TOC_PACKAGE_HOST https://dl.dropboxusercontent.com/u/172349

ENV TOC_CHROME_PACKAGE_NAME google-chrome-stable_current_amd64_v20150209.deb
ADD $TOC_PACKAGE_HOST/$TOC_CHROME_PACKAGE_NAME /usr/local/
RUN dpkg -i $TOC_CHROME_PACKAGE_NAME; \
  apt-get -y -f install && apt-get clean && rm $TOC_CHROME_PACKAGE_NAME

ENV TOC_NODE_PACKAGE_NAME node-v0.12.0-linux-x64_v20150210.tar.gz
ADD $TOC_PACKAGE_HOST/$TOC_NODE_PACKAGE_NAME /usr/local/
RUN tar -xzf $TOC_NODE_PACKAGE_NAME && rm $TOC_NODE_PACKAGE_NAME

ENV TOC_ANDROID_PACKAGE_NAME android-sdk_r24.0.2-linux_v20150210.tar.gz
ADD $TOC_PACKAGE_HOST/android-sdk_r24.0.2-linux_v20150210.tar.gz /usr/local/
RUN tar -xzf $TOC_ANDROID_PACKAGE_NAME && rm $TOC_ANDROID_PACKAGE_NAME

ENV TOC_BUILD_DEPS_PATH /usr/local/toc-build-deps/
WORKDIR $TOC_BUILD_DEPS_PATH

ENV TOC_PLATFORMS_PACKAGE_NAME platforms_v20150210.tar.gz
ADD $TOC_PACKAGE_HOST/$TOC_PLATFORMS_PACKAGE_NAME $TOC_BUILD_DEPS_PATH
RUN tar -xzf $TOC_PLATFORMS_PACKAGE_NAME && rm $TOC_PLATFORMS_PACKAGE_NAME

ENV TOC_PLUGINS_PACKAGE_NAME plugins_v20150210.tar.gz
ADD $TOC_PACKAGE_HOST/$TOC_PLUGINS_PACKAGE_NAME $TOC_BUILD_DEPS_PATH
RUN tar -xzf $TOC_PLUGINS_PACKAGE_NAME && rm $TOC_PLUGINS_PACKAGE_NAME

ENV TOC_ENGINE_PACKAGE_NAME engine_v20150210.tar.gz
ADD $TOC_PACKAGE_HOST/$TOC_ENGINE_PACKAGE_NAME $TOC_BUILD_DEPS_PATH
RUN tar -xzf $TOC_ENGINE_PACKAGE_NAME && rm $TOC_ENGINE_PACKAGE_NAME

WORKDIR /usr/local

RUN npm install -g n && npm cache clean
RUN n 0.10.36

RUN npm install -g cordova@5.0.0 && npm cache clean
RUN npm install -g gulp-cli@0.2.0 && npm cache clean
RUN npm install -g http-server@0.8.0 && npm cache clean
RUN npm install -g ionic@1.3.20 && npm cache clean
RUN npm install -g jspm@0.15.5 && npm cache clean
RUN npm install -g karma-cli@0.0.4 && npm cache clean
RUN npm install -g protractor@2.0.0 && npm cache clean

RUN webdriver-manager update

ENV DISPLAY :1
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools

# Expose ionic serve port
EXPOSE 8100
# Expose ionic serve livereload port
EXPOSE 8101
# Expose karma server port
EXPOSE 8102

WORKDIR /toc
