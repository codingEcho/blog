#### FTP服务器上传文件 /home/ftpdir/ from local /home/localpath/file.toload ####
#!/bin/bash
if [ $# -ne 2 ]
then
    echo "Usage $0 <remotepath> <localpath/name>"
    exit 1
fi

# FTP服务器存储路径
REMOTEPATH=$1
# 本地所要上传的文件名
FULLNAME=`basename $2`
# 本地所要上传文件的目录
LOCALPATH=`dirname $2`

ftp -n<<!
open 171.221.123.92
user ftpuser Ftp-213-pwd
binary
cd $REMOTEPATH
prompt
# 切换本地目录的位置
lcd $LOCALPATH
# 上传文件
put $FULLNAME
close
bye
!
