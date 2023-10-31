#!/bin/bash

echo "ISO 8601格式时间"
# ISO 8601格式时间
date --iso-8601
date --iso-8601=date
date --iso-8601=minutes
date --iso-8601=seconds

echo "自定义日期格式化"
# 自定义日期格式化
date +"%Y-%m-%d %H:%M:%S"
date +"%Y-%m-%d"

# unix时间戳转字符串
date -d @0 "+%Y-%m-%d %H:%M:%S"
# unix时间戳转字符串(UTC)
datee --utc -d @0 "+%Y-%m-%d %H:%M:%S"

# 获取unix时间戳
date --date="2022-09-13 00:00:00" +%s
# 获取unix时间戳(UTC)
date --utc --date="2022-09-13 00:00:00" +%s


echo "明天"
date -d next-day +"%Y-%m-%d %H:%M:%S"
date -d tomorrow +"%Y-%m-%d %H:%M:%S"
date -d '1 days' +"%Y-%m-%d %H:%M:%S"

echo "昨天"
date -d last-day +"%Y-%m-%d %H:%M:%S"
date -d yesterday +"%Y-%m-%d %H:%M:%S"
date -d '-1 days' +"%Y-%m-%d %H:%M:%S"

echo "下个月"
date -d next-month +"%Y-%m-%d %H:%M:%S"
date -d '1 months' +"%Y-%m-%d %H:%M:%S"

echo "上个月"
date -d last-month +"%Y-%m-%d %H:%M:%S"
date -d '-1 months' +"%Y-%m-%d %H:%M:%S"

echo "下个月"
date -d next-month +"%Y-%m-%d %H:%M:%S"
date -d '1 months' +"%Y-%m-%d %H:%M:%S"

echo "上一年"
date -d last-year +"%Y-%m-%d %H:%M:%S"
date -d '-1 years' +"%Y-%m-%d %H:%M:%S"

echo "上周一"
date -d last-monday +"%Y-%m-%d %H:%M:%S"

echo "下周一"
date -d next-monday +"%Y-%m-%d %H:%M:%S"

echo "本周一"
date -d monday +"%Y-%m-%d %H:%M:%S"

echo "上周二"
date -d last-tuesday +"%Y-%m-%d %H:%M:%S"
echo "下周二"
date -d next-tuesday +"%Y-%m-%d %H:%M:%S"
echo "本周二"
date -d tuesday +"%Y-%m-%d %H:%M:%S"

# 和sql中获取类似，直接next-tuesday不行
echo "下周二"
date -d 'next monday 1 day' +"%Y-%m-%d %H:%M:%S"

# 格式化计算某一指定日期
echo "指定日期"
date -d "-1 days 2020-11-22 08:08:08" +"%Y-%m-%d %H:%M:%S"
date -d "-1 months 2020-11-22 08:08:08" +"%Y-%m-%d %H:%M:%S"
