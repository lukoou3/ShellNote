#!/bin/bash

# 字符串截取
# 格式：${变量名:起始位置:长度}, ${str:start:len}
# 起始位置从0开始；起始位置不写的话默认为0
str="0123456789abcdef"
echo ${str:0:1}           # 0
echo ${str:0:2}           # 01
echo "${str:0:2}bb"       # 01bb
echo ${str::2}            # 01
echo ${str:2:2}           # 23
echo ${str:2:20}          # 23456789abcdef

echo "----------------------"

# 字符串替换
# 替换出现的第一个：${变量/旧/新}, ${str/old/new}
# 替换所有出现的：${变量//旧/新}, ${str//old/new}
# old可以是通配字符，不支持正则
str="123_abc_123_abc"
new="yyy"
echo ${str/123/xx}                           # xx_abc_123_abc
echo ${str//123/xx}                          # xx_abc_xx_abc
echo ${str//123/$new}                        # yyy_abc_yyy_abc
echo "${str/123/xx}"                         # xx_abc_123_abc
echo "${str//123/xx}"                        # xx_abc_xx_abc
echo "${str//123/$new}"                      # yyy_abc_yyy_abc
echo "${str//[0-9][0-9]/$new}"               # yyy3_abc_yyy3_abc

echo "----------------------"

# 字符串删除
# ${variable#delete_part}, 从左往右删
# ${variable##delete_part}, 从左往右删(贪婪模式)
# ${variable%delete_part}, 从右往左删
# ${variable%%delete_part}, 从右往左删(贪婪模式)
# delete_part代表要删除的部分，这部分会在要操作的变量中进行匹配，匹配成功的就会被删除。
str="123_abc_123_abc"
echo "${str#*3}"                # _abc_123_abc
echo "${str##*3}"               # _abc
echo "${str%3*}"                # 123_abc_12
echo "${str%%3*}"               # 12
echo "${str%*3}"                # 123_abc_123_abc
# 实现path去除最后的/
path1="/home/hadoop/files/"
path2="/home/hadoop/files2"
echo "${path1%/}"                # /home/hadoop/file
echo "${path2%/}"                # /home/hadoop/files2

echo "----------------------"

# 给变量赋初值
# 格式：${var:-str}
# 注意：若变量var有值，则返回变量var的值，否则返回str的值
str="111"
default_str="000"
echo ${str:-000}                          # 111
unset str
echo "${str:-000}"                        # 000
echo "${str:-$default_str}"               # 000

echo "----------------------"

# 字符串正则替换
# 默认的${str//old/new}替换最多支持通配符替换，更负责的正则替换可以使用sed实现
# sed默认也是最多支持通配符，-r参数开启正则支持；支持引用分组；匹配/可以使用#作为分隔符
str="123_abc_123_abc"
str2="123/abc/123/abc"
echo $str | sed "s/123/xxx/"                     # xxx_abc_123_abc
echo $str | sed "s/123/xxx/g"                    # xxx_abc_xxx_abc
echo $str | sed -r "s/[1-9]+/xxx/g"              # xxx_abc_xxx_abc
echo $str | sed -r "s/^[1-9]+/xxx/g"             # xxx_abc_123_abc
echo $str | sed -r "s/([1-9]+)/\1\1x/g"          # 123123x_abc_123123x_abc
echo $str2 | sed -r "s#[1-9]+#xxx#g"             # xxx/abc/xxx/abc
echo $str2 | sed -r "s#[1-9]+/#xxx_#g"           # xxx_abc/xxx_abc

echo "----------------------"

# 字符串包含判断
# 使用[[ str =~ pattern ]], 其实这个值正则匹配判断, 能判断是否匹配的功能更强大, 不仅仅判断字符串包含。
# linux中的正则似乎不支持\d,\w等
[[ "111_abc" =~ 111 ]]; echo $?                  # 0
[[ "111_abc" =~ [0-9]+ ]]; echo $?               # 0
[[ "111_abc" =~ [0-9]+a ]]; echo $?              # 1
[[ "111_abc" =~ [0-9]+_a ]]; echo $?             # 0
[[ "111_abc" =~ \d+ ]]; echo $?                  # 1







