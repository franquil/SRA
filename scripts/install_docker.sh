#!/usr/bin/env bash

#######################################################
# Based on Amazon linux to install docker
# reference：
#   - https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html
#######################################################

set -o errexit
set -o errtrace
set -o nounset
set -o pipefail

function mainScript() {
  yum update -y
  yum install -y docker
  service docker start
  usermod -a -G docker ec2-user
  docker info
  curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  docker-compose --version
  echo -n
}

function safeExit() {
  trap - INT TERM EXIT
  exit
}

mainScript

safeExit
