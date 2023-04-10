#!/bin/bash

<<comment
# if 语句语法格式：
if condition
then
    command1 
    command2
    ...
    commandN 
fi

# if else 语法格式：
if condition
then
    command1 
    command2
    ...
    commandN
else
    command
fi

# if else-if else 语法格式：
if condition1
then
    command1
elif condition2 
then 
    command2
else
    commandN
fi

case ... esac 语法格式如下：
case 值 in
模式1)
    command1
    ...
    commandN
    ;;
模式2)
    command1
    ...
    commandN
    ;;
*)
    command1
    ...
    commandN
    ;;
esac

comment

# if else 流程控制
str="123_abc"
if [ -n "$str" ]; then
  echo "$str not empty"
fi

if [[ "$str" =~ ^[0-9]+$ ]]; then
    echo "$str is number"
else
    echo "$str is not number"
fi

if [[ "$str" =~ ^[0-9]+$ ]]; then
    echo "$str is number"
elif [[ "$str" =~ [0-9]+ ]]; then
    echo "$str contains number"
else
    echo "$str not contains number"
fi

echo "----------------------"

# case 流程控制
str="2"
case $str in
"1")
    echo "周一"
;;
"2")
    echo "周二"
;;
*)
    echo "other"
;;
esac

# ;和&&和||的区别。&&和||和其它语言的含义不同
echo "111"; [ "1" == "1" ]; echo "222"
echo "111" && [ "1" == "1" ] &&  echo "222"
echo "111" || [ "1" == "1" ] ||  echo "222"
echo "111"; [ "1" == "2" ]; echo "222"
echo "111" && [ "1" == "2" ] &&  echo "222"
echo "111" || [ "1" == "2" ] ||  echo "222"
echo "111" || [ "1" == "2" ] &&  echo "222"

[ "1" == "2" ] && echo "111"  &&  echo "222"
[ "1" == "2" ] || echo "111"  &&  echo "222"

