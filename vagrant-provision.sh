#!/usr/bin/env bash
# run toc-setup-env from vagrant provisioner before this script
source /etc/environment

source $TOC_ENV_PATH/toc-setup-alias.sh
source $TOC_ENV_PATH/toc-setup-docker.sh
source $TOC_ENV_PATH/toc-setup-dev.sh
