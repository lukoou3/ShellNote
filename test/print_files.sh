#!/bin/bash

# 递归打印输入目录的文件和文件夹信息

function print_files(){
    local path=$1
    #for sub_path in $(ls $path)
    # windows中文件名有空格问题
    for sub_path in $(ls $path | tr " " "\?")
    do
        sub_path=$(tr "\?" " " <<<$sub_path)
        # 打印路径名称
        echo "$path/$sub_path"
        #如果是文件夹递归
        if [ -d "$path/$sub_path" ]; then
            print_files "$path/$sub_path"
        fi;
    done
}


if [ $# -eq 0 ]; then
    echo "input arg：path"
    exit 1;
elif [ ! -e $1 ]; then
    echo "$1 not exist"
    exit 1;
else
    path=$1
    print_files ${path%*/}
fi;
