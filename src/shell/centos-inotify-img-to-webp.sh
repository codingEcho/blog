#!/bin/sh

#注意：目录末尾一定加斜杠 “/”
# ===================================参数说明================================
#   -m 是保持一直监听
#   -r 是递归查看目录
#   -q 是打印出事件
#   --timefmt 是指定时间的输出格式
#   --format 指定文件变化的详细信息
#   -e create,move,delete,modify,attrib 是指 “监听 创建 移动 删除 写入 权限” 事件
# ===================================参数说明================================

# get the current path
# CURPATH=`pwd`
# 指定所要监听的目录(目录末尾一定要加斜杠，如:'/root/sub/')

rootDir=/sxyimagedata/webp/
# 指定监听的事件为close_write
inotifywait -mr --timefmt '%Y/%m/%d/%H:%M' --format '%w%f' -e close_write $rootDir | while read file
do
       echo "filepath>>${dir}${file}"
       echo "dir>>${dir}"
       echo "file>>${file}"
       fileName=${file}
       fName=$fileName
         if [ "${fName##*.}" = "jpg" -o "${fName##*.}" = "JPG" -o "${fName##*.}" = "png" -o "${fName##*.}" = "PNG" -o "${fName##*.}" = "bmp"  -o "${fName##*.}" = "BMP" ]; 
             then
                 inputFilePath=$fName
                 outputFilePath=${fName%.*}.webp
                # 判断文件是否存在，如果文件不存在，进行转化
                if [ ! -f "$outputFilePath" ]
                 then
                  echo $inputFilePath":正在创建webp格式>>>>>>"  
                  cwebp -q 75 -m 6 $inputFilePath -o $outputFilePath
                 else 
                  echo "$outputFilePath"文件已经存在"<<<<<<"
                fi 
             else
                 echo "$outputFilePath"文件不是jpg"<<<<<<"
             fi
done
