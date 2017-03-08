#!/bin/bash  
function scanfile(){  
    for file in ` ls $1 `  
    do  
        # 如果是目录
        if [ -d $1"/"$file ]  
        then  
             echo --------扫描目录$file--------
             scanfile $1"/"$file
        # 如果是文件    
        else  
             fName=$file
             if [ "${fName##*.}" = "jpg" ]; 
             then
                 echo "<<"当前目录">>" $1
                 inputFilePath=$1"/"$file
                 outputFilePath=$1"/"${fName%.*}.webp
                # 判断文件是否存在，如果文件不存在，进行转化
                if [ ! -f "$outputFilePath" ]
                 then
                  echo $inputFilePath":正在创建webp格式>>>>>>"  
                  cwebp -q 75 -m 6 $inputFilePath -o $outputFilePath
                 else 
                  echo "$outputFilePath"文件已经存在"<<<<<<"
                fi 
             else
                 echo "$outputFilePath"文件已经是webp"<<<<<<"
             fi
        fi  
    done  
} 
# 要处理的图片根目录 
INIT_PATH="/sxyimagedata"  
scanfile $INIT_PATH  
