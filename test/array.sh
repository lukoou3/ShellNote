#!/bin/bash

home=$(cd `dirname $0`; pwd)

ips=(a b c d e f)
ips_size=${#ips[*]}
ip_starts=$( seq 0 $(($ips_size - 1)) )
ip_ends=$( seq 0 $(($ips_size - 1)) )

for ((i=0;i<$ips_size;i++))
do
    ip_starts[$i]=0
    ip_ends[$i]=0
done



# 遍历每个节点
for ((i=0;i<$ips_size;i++))
do
    ip=${ips[$i]}
    start=${ip_starts[$i]}
    end=${ip_ends[$i]}
    echo "ip:${ip},start:${start},end:${end}"
    if [ $start -eq 0 ]; then
      echo "start"
      ip_starts[$i]=1
    fi
    if [ $start -eq 1 ] && [ $end -eq 0 ] ; then
      echo "end"
      ip_ends[$i]=1
    fi
done

for ((i=0;i<$ips_size;i++))
do
    ip=${ips[$i]}
    start=${ip_starts[$i]}
    end=${ip_ends[$i]}
    echo "ip:${ip},start:${start},end:${end}"
    if [ $start -eq 0 ]; then
      echo "start"
      ip_starts[$i]=1
    fi
    if [ $start -eq 1 ] && [ $end -eq 0 ] ; then
      echo "end"
      ip_ends[$i]=1
    fi
done
