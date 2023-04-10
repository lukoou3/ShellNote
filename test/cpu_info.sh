#!/bin/bash
cpu_info=$( top -b -n1 | grep -E  "^(top)|(Tasks)|(%Cpu)|(KiB Mem)|(KiB Swap)" )
cpu_load_avg=$( echo "$cpu_info" | grep -E  "^top" )
cpu_load_avg="${cpu_load_avg##*age: }"
cpu_load_avg1=$( echo $cpu_load_avg | awk -F ", " '{print $1}' )
cpu_load_avg2=$( echo $cpu_load_avg | awk -F ", " '{print $2}' )
cpu_load_avg3=$( echo $cpu_load_avg | awk -F ", " '{print $3}' )

cpu_s=$( echo "$cpu_info" | grep -E  "^%Cpu" )
cpu_s_id=$( echo $cpu_s | sed -r "s/.+ ([0-9.]+) id.+/\1/" )
cpu_s_us=$( awk 'BEGIN{printf "%.1f\n",(100 - '$cpu_s_id')}' )

echo "load average:$cpu_load_avg"
echo "load average 1m:$cpu_load_avg1"
echo "load average 5m:$cpu_load_avg2"
echo "load average 15m:$cpu_load_avg3"

#echo "$cpu_s"
echo "cpu_s_us:${cpu_s_us}%"
echo "cpu_s_id:${cpu_s_id}%"

# top -b -n5 | grep -E  "^(top)|(Tasks)|(%Cpu)|(KiB Mem)|(KiB Swap)"
