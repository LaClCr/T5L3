#!/bin/bash
pos=`expr ${#1} - 1` 
prev=0 
result=0 
while [ $pos -ge 0 ];do 
	case "${1:$pos:1}"
	in 
		M) factor=1000 ;; 
		D) factor=500 ;; 
		C) factor=100 ;; 
		L) factor=50 ;; 
		X) factor=10 ;; 
		V) factor=5 ;; 
		I) factor=1 ;; 
	esac 

	if [ $factor -lt $prev ];then 
		result=`expr $result - $factor` 
	else 
		result=`expr $result + $factor` 
	fi 
	prev=$factor 
	pos=`expr $pos - 1` 
done 

if [ $result -gt 1999 ] 
then 
	echo "El número introducido es superior a 1999. No se realizará la conversión."
	exit 0
fi

echo "El equivalente en decimal a $1 es $result"
