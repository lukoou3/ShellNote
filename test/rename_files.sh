#!/bin/bash

# 递归替换重命名输入目录的文件信息

function rename_files(){
    local old=$1
    local new=$2
    local path=$3
    #for sub_path in $(ls $path)
    # windows中文件名有空格问题
    for sub_path in $(ls $path | tr " " "\?")
    do
        sub_path=$(tr "\?" " " <<<$sub_path)
        # 是文件并且包含字符串
        if [ -f "$path/$sub_path" ] && [[ "$sub_path" =~ $old ]]; then
            new_file=${sub_path//$old/$new}
            echo "$path/$sub_path -> $path/$new_file"
            mv "$path/$sub_path" "$path/$new_file"
        fi
        # 如果是文件夹递归
        if [ -d "$path/$sub_path" ]; then
            rename_files "$old $new" "$path/$sub_path"
        fi
    done
}

old=$1
new=$2
path=$3
if [ $# -ne 3 ]; then
    echo "input args：3 cnt args"
    exit 1;
elif [ ! -d "$path" ]; then
    echo "$path is not dir"
    exit 1;
else
    path=${path%*/}
    rename_files "$old" "$new" "$path"
fi

# CentOS的rename使用的是c语言版本的 而ubuntu的rename使用的是perl的版本,意味着很多ubuntu上面的扩展命令  CentOS不支持.
# 解决办法, 在CentOS上面安装prename包
# sudo yum install epel-release -y
# sudo yum install prename -y
# find . -name "*.txt" | xargs prename 's/a.txt/x.map3/'