#!/bin/bash

#引数の数チェック
if [ $# -ne 2 ]; then
	
	echo "実行するには2個の引数（整数に限る）が必要です。"  
	exit 1
fi

#引数を変数にいれる
m=$1
n=$2

#第1引数の整数チェック	
expr "$m" + 1 >/dev/null 2>&1
if [ $? -lt 2 ]; then
	
	: #なにもしない

else

	echo "第1引数に整数以外があります。"
	exit 1

fi

#第2引数の整数チェック		
expr "$n" + 1 >/dev/null 2>&1
if [ $? -lt 2 ]; then

	: #なにもしない

else
	echo "第2引数に整数以外があります。"
	exit 1

fi

#負の整数チェック
if [ 0 -lt $1 ]; then
	: #なにもしない
else
	echo "第1引数が負の整数です。"
	exit 1
fi

if [ 0 -lt $2 ];then
	: #なにもしない
else
	echo "第2引数が負の整数です。"
	exit 1

fi

#ユークリッドの互除法を利用して最大公約数を求める
while [ 0 -lt $1 ]
	do

		#余りをとる
		r=`expr $2 % $1`

		#位置パラメータを設定しなおす
		set $r $1
      
	done

echo "$mと$nの最大公約数は$2です。"

