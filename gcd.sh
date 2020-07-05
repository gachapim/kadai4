#!/bin/bash

#引数の数チェック
if [ $# -ne 2 ]; then
	
	echo "実行するには2個の引数（整数に限る）が必要です。"  
	exit 1
fi

#第1引数の整数チェック	
expr "$1" + 1 >/dev/null 2>&1
if [ $? -lt 2 ]; then
	
	echo "第1引数は$1です。"

else

	echo "第1引数に整数以外があります。"
	exit 1

fi

#第2引数の整数チェック		
expr "$2" + 1 >/dev/null 2>&1
if [ $? -lt 2 ]; then

	echo "第2引数は$2です。"
else
	echo "第2引数に整数以外があります。"
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

echo "最大公約数は$2です。"

