function error {
  printf "\e[31m$1\n\033[0m"
}
function info {
  printf "\e[32m$1\n\033[0m"
}

info "Installing Java 7"
sudo apt-get install openjdk-7-jdk openjdk-7-jre -y
info "...done"