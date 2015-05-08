FROM ubuntu:14.04.2

MAINTAINER Lewis Liu

# Hasn't been updated in a while

WORKDIR /usr/local

RUN apt-get update \
  && apt-get install -y \
    ca-certificates=20130906ubuntu2 \
    libsqlite3-dev=3.8.2-1ubuntu2 \
  && apt-get clean \
  && rm -rf /tmp/* /var/tmp/*

ENV TOC_PACKAGE_HOST https://dl.dropboxusercontent.com/u/172349

ENV TOC_DRONE_PACKAGE_NAME drone_v20150210.deb
ADD $TOC_PACKAGE_HOST/$TOC_DRONE_PACKAGE_NAME /usr/local/
RUN dpkg -i $TOC_DRONE_PACKAGE_NAME && rm $TOC_DRONE_PACKAGE_NAME

EXPOSE 8080

ENV DRONE_SERVER_PORT 0.0.0.0:8080
ENV DRONE_DATABASE_DATASOURCE /var/lib/drone/drone.sqlite

# Pass in drone secrets as env var on run
#ENV DRONE_GITHUB_CLIENT <CLIENT_TOKEN_HERE>
#ENV DRONE_GITHUB_SECRET <CLIENT_SECRET_HERE>

CMD /usr/local/bin/droned
