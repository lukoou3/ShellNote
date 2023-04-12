#!/bin/bash

<<comment
# for循环一般格式为：
for var in item1 item2 ... itemN
do
    command1
    command2
    ...
    commandN
done

# 写成一行：
for var in item1 item2 ... itemN; do command1; command2… done;

# while
while condition
do
    command
done

# 无限循环
while :
do
    command
done

while true
do
    command
done

comment

for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done

echo "----------------------"

for str in This is a string
do
    echo $str
done

echo "----------------------"

int=1
while [ $int -le 5 ]
do
    echo $int
    let "int++"
done

echo "----------------------"

int=0
while true
do
    let "int++"
    if [ $(($int%2)) -eq 0 ] ; then
        continue
    fi
    echo $int
    if [ $int -gt 10 ] ; then
        break
    fi
done
