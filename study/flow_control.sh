#!/bin/bash

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

