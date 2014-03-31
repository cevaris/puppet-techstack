#!/usr/bin/env bash

function error {
  printf "\e[31m$1\n\033[0m"
}
function info {
  printf "\e[32m$1\n\033[0m"
}

info "Updtaing..."
\curl -L https://get.rvm.io |  bash -s stable --ruby --autolibs=enable --auto-dotfiles
source ~/.rvm/scripts/rvm
rvm reload
rvm use default
ruby --version
rvm install ruby-2.0.0
info "...done"