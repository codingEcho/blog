####ftp服务器上下载/home/data/a.sh to local /home/databackup####
#!/bin/bash
if [ $# -ne 2 ]
then
    echo "Usage $0 <pathname/filename> <localpathname>"
    exit 1
fi
# 获取目标文件名
FULLNAME=`basename $1`
# 获取目标路径
PATHNAME=`dirname $1`
# 本地存储路径
LOCALPATH=$2

ftp -n<<!
open 171.211.173.39
user ftpuser Ftp-213
binary
cd $PATHNAME
# 设置本地存储目录
lcd $LOCALPATH
prompt
# 下载文件
get $FULLNAME
close
bye
!
