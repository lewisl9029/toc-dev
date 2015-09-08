#!/usr/bin/env bash
# run toc-setup-env from vagrant provisioner before this script
source ~/.pam_environment

source $TOC_ENV_PATH/toc-setup-alias.sh
source $TOC_ENV_PATH/toc-setup-docker.sh

echo "VM setup complete."
echo "Please run toc-pull or toc-build to set up the docker container."
