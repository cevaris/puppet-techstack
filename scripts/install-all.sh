#!/usr/bin/env bash

function error {
  printf "\e[31m$1\n\033[0m"
}
function info {
  printf "\e[32m$1\n\033[0m"
}



info "Updtaing..."
sudo apt-get update
info "... done updating"

info "Installing prerequisites"
sudo apt-get install unzip vim build-essential -y
touch ~/.bash_profile
info "...done"

info "Java 1.7 installation..."
./install-java.sh
info "done"

info "Cassandra installation..."
./install-cassandra.sh
info "done"

info "Redis installation..."
./install-redis.sh
info "done"


info "ElastiSearch installation..."
./install-elasticsearch.sh
info "done"


info "Kafka installation..."
./install-kafka.sh
info "done"