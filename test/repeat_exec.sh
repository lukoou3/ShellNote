#!/bin/bash

# 重复定时执行命令

function repeat_exec(){
    while true
    do
        eval "$1"
        sleep 2
    done
}

if [ $# -ne 1 ]; then
    echo "input arg：exec command"
    exit 1;
else
    repeat_exec "$1"
fi

# 持续不断输出某个进程的统计，不需要用top需要实时不断的盯着屏幕
# ./repeat_exec.sh "ps -ef | grep 2419 | grep -v grep"
# ps aux cpu占比和top一样，用这个，java -cp java-utils.jar com.util.java.CpuTest 2
# ./repeat_exec.sh "ps aux | grep 3854 | grep -v grep"