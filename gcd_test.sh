#!/bin/bash

# ERROR関数
ERROR_EXIT () { 
	echo "$1" >&2
	rm -f /tmp/$$-* 
	exit 1 
}

#引数チェック用テスト準備
tmp=/tmp/$$

echo "実行するには2個の引数（整数に限る）が必要です。" > $tmp-args
echo "第1引数に整数以外があります。" > $tmp-nat1
echo "第2引数に整数以外があります。" > $tmp-nat2
echo "第1引数が0または負の整数です。" > $tmp-int1
echo "第2引数が0または負の整数です。" > $tmp-int2

#引数が2以外の場合                                                                                                   

./gcd.sh > $tmp-ans
diff $tmp-ans $tmp-args || ERROR_EXIT "引数がないときのチェックミス"

./gcd.sh > $tmp-ans
diff $tmp-ans $tmp-args || ERROR_EXIT "引数がないときのチェックミス"

./gcd.sh 1 > $tmp-ans
diff $tmp-ans $tmp-args || ERROR_EXIT "引数が1つのときのチェックミス"

./gcd.sh 1 2 3 > $tmp-ans
diff $tmp-ans $tmp-args || ERROR_EXIT "引数が3つのときのチェックミス" 

#引数が整数以外の場合

./gcd.sh 1.1 1 > $tmp-ans
diff $tmp-ans $tmp-nat1 || ERROR_EXIT "第1引数が整数でないときのチェックミス"

./gcd.sh 1 1.1 > $tmp-ans
diff $tmp-ans $tmp-nat2 || ERROR_EXIT "第2引数が整数でないときのチェックミス" 

./gcd.sh a a > $tmp-ans
diff $tmp-ans $tmp-nat1 || ERROR_EXIT "文字が入力されたときのチェックミス" 

#引数がマイナスの場合

./gcd.sh -1 1 > $tmp-ans 
diff $tmp-ans $tmp-int1 || ERROR_EXIT "第1引数がマイナスのときのチェックミス"

./gcd.sh 1 -1 > $tmp-ans
diff $tmp-ans $tmp-int2 || ERROR_EXIT "第2引数がマイナスのときのチェックミス"    

#最大公約数の計算チェック

#56と32のとき
echo "56と32の最大公約数は8です。" > $tmp-test1
./gcd.sh 56 32 > $tmp-ans
diff $tmp-ans $tmp-test1 || ERROR_EXIT "56と32の計算ミス" 

#156と132のとき
echo "156と132の最大公約数は12です。" > $tmp-test2
./gcd.sh 156 132 > $tmp-ans
diff $tmp-ans $tmp-test2 || ERROR_EXIT "156と132の計算ミス" 

#1885と1335のとき
echo "1885と1335の最大公約数は5です。" > $tmp-test3
./gcd.sh 1885 1335 > $tmp-ans
diff $tmp-ans $tmp-test3 || ERROR_EXIT "1885と1335の計算ミス" 

#12364と14852のとき
echo "12364と14852の最大公約数は4です。" > $tmp-test4
./gcd.sh 12364 14852 > $tmp-ans
diff $tmp-ans $tmp-test4 || ERROR_EXIT "12364と14852の計算ミス" 

#後始末
rm -f /tmp/$$-* 
