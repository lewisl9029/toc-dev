#!/usr/bin/env bash
#manually setup git and clone repo, see drone.sh in secrets
#echo GITHUB_OAUTH_TOKEN= | sudo tee -a /etc/environment
#echo BITBUCKET_OAUTH_TOKEN= | sudo tee -a /etc/environment
#echo DRONE_GITHUB_CLIENT= | sudo tee -a /etc/environment
#echo DRONE_GITHUB_SECRET= | sudo tee -a /etc/environment
#echo DRONE_SMTP_HOST= | sudo tee -a /etc/environment
#echo DRONE_SMTP_PORT= | sudo tee -a /etc/environment
#echo DRONE_SMTP_FROM= | sudo tee -a /etc/environment
#echo DRONE_SMTP_USER= | sudo tee -a /etc/environment
#echo DRONE_SMTP_PASS= | sudo tee -a /etc/environment
#sudo apt-get update \
#  && sudo apt-get install -y \
#    git=1:1.9.1-1ubuntu0.1 \
#  && sudo apt-get clean
#cd ~
#GITHUB_OAUTH_TOKEN=
#git clone https://$GITHUB_OAUTH_TOKEN@github.com/lewisl9029/toc.git
#git clone https://$GITHUB_OAUTH_TOKEN@github.com/lewisl9029/toc-env.git
#
#cd toc-env
#
#source drone-provision.sh
#deprovision and create vm image

source ./vagrant-provision.sh

source ./toc-setup-drone.sh
