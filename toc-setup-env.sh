#!/usr/bin/env bash
(
cat <<ENV
TOC_HOST_IP=$1
USERNAME=$(whoami)
TOC_PATH=/home/$(whoami)/toc
TOC_LANDING_PATH=/home/$(whoami)/toc-landing
TOC_ENV_PATH=/home/$(whoami)/toc-env
ENV
) | tee ~/.pam_environment
