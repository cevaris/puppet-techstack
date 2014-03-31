#!/usr/bin/env bash

function error {
  printf "\e[31m$1\n\033[0m"
}
function info {
  printf "\e[32m$1\n\033[0m"
}

info "Updtaing..."
\curl -sSL https://get.rvm.io | bash -s stable --ruby
info "...done"


