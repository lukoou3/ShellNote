#!/bin/bash

# 字符串分隔提取-cut
# 简单的逻辑可以使用cut，cut默认分隔符为制表符\t，不是空格或者\t，这点可能不好
echo '1 2 3 4 5 6' | cut -f 1 -d " "         # 1
echo '1 2 3 4 5 6' | cut -f 2 -d " "         # 2
echo '1 2 3 4 5 6' | cut -f 2,4 -d " "       # 2 4
echo '1  2 3 4 5 6' | cut -f 3 -d " "        # 2
echo '1,2,3,4,5,6' | cut -f 1 -d ,           # 1

echo "----------------------"

# awk这点好的，和py默认的split类似
echo '1 2 3 4 5 6' | awk '{print $2}'        # 2
echo '1  2 3 4 5 6' | awk '{print $2}'       # 2
echo '1   2 3 4 5 6' | awk '{print $2}'      # 2
echo '1     2 3 4 5 6' | awk '{print $2}'    # 2
# 以空格冒号作为字段分割
echo '1  :2 3 4 5 6' | awk -F '[ :]+' '{print $2}'    # 2


