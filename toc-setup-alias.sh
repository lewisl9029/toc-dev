#!/usr/bin/env bash
(
cat <<EOF
alias toc="sudo docker run \
  -i -t --rm \
  -p 8100:8100 \
  -p 8101:8101 \
  -p 8102:8102 \
  -v $TOC_PATH:/toc \
  -v $TOC_ENV_PATH/cache/gradle:/root/.gradle \
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

alias toctu="toc \
  sh -c 'xvfb-run -n 1 --server-args=\"-screen 0, 1366x768x24\" \
    gulp test-unit "$@"'"

alias tocte="toc \
  sh -c 'xvfb-run -n 1 --server-args=\"-screen 0, 1366x768x24\" \
    gulp test-e2e "$@"'"

alias tocv="toc \
  sh -c 'xvfb-run -n 1 --server-args=\"-screen 0, 1366x768x24\" \
    gulp verify "$@"'"

alias tocl="sudo docker run \
  -i -t --rm \
  -p 8200:8200 \
  -p 8201:8201 \
  -v $TOC_LANDING_PATH:/toc-landing \
  -w="/toc-landing" \
  toc-dev:latest \
  "$@""

alias toclg="tocl \
  gulp "$@""

alias tocln="tocl \
  npm "$@""
EOF
) | tee ~/.bash_aliases
