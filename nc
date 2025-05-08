#!/bin/bash
# 获取到传入的args参数，默认为main
args=${1:-main}
# 获取当前提交的哈希值
current_commit=$(git rev-parse HEAD)
# 要查看的是当前main分支，分支名为master时要修改
next_commits=$(git rev-list --topo-order HEAD..$args | tail -n 1)
#echo "参数：$args"
#echo "当前commit：$current_commit"
#echo "下一个commit：$next_commits"
# 检查是否有下一个提交
if [ -z "$next_commits" ]; then
    echo "没有下一个提交，所查分支：$args"
    exit 1
fi
# 获取下一个提交的哈希值
next_commit=$(echo "$next_commits" | head -n 1)
# 切换到下一个提交
git checkout $next_commit -f


