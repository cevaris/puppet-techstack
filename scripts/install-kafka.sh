#!/usr/bin/env bash

function error {
  printf "\e[31m$1\n\033[0m"
}
function info {
  printf "\e[32m$1\n\033[0m"
}

ORIGIN_DIR=$(pwd)
VERSION=0.8.1
ROOT_DIR=/usr/local

info "Download Kafka..."
wget http://www.us.apache.org/dist/kafka/$VERSION/kafka_2.8.0-$VERSION.tgz
tar xzf kafka_2.8.0-$VERSION.tgz
rm kafka_2.8.0-$VERSION.tgz
info "done"

info "Preparing for Kafka installation..."
sudo rm -r $ROOT_DIR/kafka_2.8.0-$VERSION
sudo mkdir -p $ROOT_DIR
info "done"

info "Moving Kafka to $ROOT_DIR..."
sudo mv kafka_2.8.0-$VERSION $ROOT_DIR
sudo ln -sfn $ROOT_DIR/kafka_2.8.0-$VERSION $ROOT_DIR/kafka
info "done"


info "Exporting Kafka to path..."
echo "export PATH=$ROOT_DIR/kafka/bin:\$PATH" >> ~/.bash_profile
source ~/.bash_profile
info "done"


info "********************************************"
info "First start Zookeeper with the following command:"
info "zookeeper-server-start.sh $ROOT_DIR/kafka/config/zookeeper.properties"
info "Start Kafka with the following command:"
info "kafka-server-start.sh $ROOT_DIR/kafka/config/server.properties"
info "********************************************"
