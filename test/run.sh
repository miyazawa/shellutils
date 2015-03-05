#!/usr/bin/ksh
for i in $(ls -1 ./test/test_*.sh)
do
	echo "------------------------------"
	echo "[target] "$i
	./$i
done
