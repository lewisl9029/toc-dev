#!/usr/bin/env bash
(
cat <<EOF
alias toc="sudo docker run \
  -i -t --rm \
  -p 8100:8100 \
  -p 8101:8101 \
  -p 8102:8102 \
  -v $TOC_PATH:/toc \
  toc-dev:latest \
  "$@""

alias tocb="tocg \
  build "$@""

alias tocg="toc \
  gulp "$@""

alias toci="tocj \
  install "$@""

alias tocj="toc \
  jspm "$@""

alias tocn="toc \
  npm "$@""

alias tocp="tocg \
  package "$@""

alias tocs="tocg \
  serve "$@""

alias toct="toc \
  sh -c 'xvfb-run -n 1 --server-args=\"-screen 0, 1366x768x24\" \
    gulp test "$@"'"

alias tocv="toc \
  sh -c 'xvfb-run -n 1 --server-args=\"-screen 0, 1366x768x24\" \
    gulp verify "$@"'"
EOF
) | tee ~/.bash_aliases
