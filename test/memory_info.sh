#!/bin/bash
mem_info=$( free -m | grep '^Mem:' )
mem_used=$( echo "$mem_info" | awk '{print $3}' )
mem_total=$( echo "$mem_info" | awk '{print $2}' )
mem_avail=$( echo "$mem_info" | awk '{print $7}' )
mem_percent=$((mem_used*100/mem_total))

echo -e "mem_total:${mem_total}\nmem_used:${mem_used}\nmem_avail:${mem_avail}\nmem_percent:${mem_percent}%"

# top -b -n5 | grep -E  "^(top)|(Tasks)|(%Cpu)|(KiB Mem)|(KiB Swap)"
