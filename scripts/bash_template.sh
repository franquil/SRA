#!/usr/bin/env bash

#######################################################
# 一份简单的bash脚本模板
# 用途： 用于创建常用的脚本文件
# 作者： Frank Q Liu (Qing.liu.frank@gmail.com)
# 待办事项：
#   - 添加日志功能
#   - 添加颜色
# 版本：0.1
# 修改日期： 2018.10.12
# 版权： MIT
# 参考：
#   - https://github.com/natelandau/shell-scripts
#   - https://github.com/ralish/bash-script-template
#   - https://github.com/kvz/bash3boilerplate
#######################################################

# bash脚本运行环境配置

# 遇到错误后退出
set -o errexit
#如需显示错误，请解除本句注释
# set -o errexit || ture 
set -o errtrace
set -o nounset # 禁止使用未定义变量
set -o pipefail

# 定义主脚本函数
function mainScript() {
  ###### 主脚本开始 ######
  
  echo -n
  ###### 主脚本结束 ######
}

#  安全退出
# -----------------------------------
# Non destructive exit for when script exits naturally.
# Usage: Add this function at the end of every script.
# -----------------------------------
function safeExit() {
  trap - INT TERM EXIT
  exit
}

# 执行默认主脚本函数
mainScript

# 退出
safeExit

