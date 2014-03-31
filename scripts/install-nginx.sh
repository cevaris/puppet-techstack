#!/usr/bin/env bash

function error {
  printf "\e[31m$1\n\033[0m"
}
function info {
  printf "\e[32m$1\n\033[0m"
}



info "Install for Nginx"
sudo apt-get install nginx -y
update-rc.d nginx defaults
info "...done"

info "Starting Nginx"
sudo service nginx start
info "...done"


info "Install for Phusion"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
sudo apt-get install apt-transport-https ca-certificates -y
sudo mkdir -p /etc/apt/sources.list.d/

PHUSION="deb https://oss-binaries.phusionpassenger.com/apt/passenger precise main"
if grep "$PHUSION" /etc/apt/sources.list.d/passenger.list >/dev/null; then
  echo "Phusion already added"
else
  echo "Adding DSE apt sources"
  sudo echo $PHUSION | sudo tee -a /etc/apt/sources.list.d/passenger.list
fi

sudo chown root: /etc/apt/sources.list.d/passenger.list
sudo chmod 600 /etc/apt/sources.list.d/passenger.list
sudo apt-get update
sudo apt-get install nginx-extras passenger -y
sudo service nginx restart
info "...done"
