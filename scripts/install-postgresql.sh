#!/usr/bin/env bash

function error {
  printf "\e[31m$1\n\033[0m"
}
function info {
  printf "\e[32m$1\n\033[0m"
}



info "Installing postgresql"
sudo apt-get install libpq-dev postgresql postgresql-contrib -y
info "...done"