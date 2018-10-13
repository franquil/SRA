#!/usr/bin/env bash

#######################################################
# 基于Amazon linux系统安装docker
# 参考：
#   - https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html
#######################################################

# 遇到错误后退出
set -o errexit
set -o errtrace
set -o nounset # 禁止使用未定义变量
set -o pipefail

function mainScript() {
  yum update -y
  yum install -y docker
  service docker start
  usermod -a -G docker ec2-user
  docker info
  echo -n
}

function safeExit() {
  trap - INT TERM EXIT
  exit
}

mainScript

safeExit

