#!/usr/bin/env bash
if [ -z "$USERNAME" ]; then
  USERNAME=$(whoami)
  echo "USERNAME=$USERNAME" | sudo tee -a /etc/environment
fi

if [ -z "$TOC_PATH" ]; then
  TOC_PATH=/home/$USERNAME/toc
  echo "TOC_PATH=$TOC_PATH" | sudo tee -a /etc/environment
fi

if [ -z "$TOC_ENV_PATH" ]; then
  TOC_ENV_PATH=/home/$USERNAME/toc-env
  echo "TOC_ENV_PATH=$TOC_ENV_PATH" | sudo tee -a /etc/environment
fi
