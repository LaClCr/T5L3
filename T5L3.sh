#!/bin/bash
dec=( 1000 900 500 400 100 90 50 40 10 9 5 4 1 ) 
rom=( M CM D CD C XC L XL X IX V IV I ) 
num=$1
comprobador='^-?[0-9]+([.][0-9]+)?$' 


function romanoADecimal () {
pos=`expr ${#num} - 1` 
prev=0 
result=0 
while [ $pos -ge 0 ];do 
	case "${num:$pos:1}"
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

echo "El equivalente en decimal a $num es $result"
}


function decimalARomano () {
aux=$num 
pos=0 

for item in ${dec[@]}
do 
	valor=`expr $aux / $item` 
	resto=`expr $aux % $item` 
	cont=0 
	while [ $cont -lt $valor ]
	do 
		result=`echo $result${rom[$pos]}`
		cont=`expr $cont + 1` 
	done 

	pos=`expr $pos + 1` 
	aux=$resto 

done 

echo "El equivalente en numeros romanos a $num es $result"
}


if [ ${num:0:1} == "M" ] || [ ${num:0:1} == "D" ] || [ ${num:0:1} == "C" ] || [ ${num:0:1} == "V" ] || [ ${num:0:1} == "X" ] || [ ${num:0:1} == "I" ]
then
	tipo=1
elif [[ $num =~ $comprobador ]]
then	
	tipo=2
	if [[ ($num -ge 1) && (num -le 1999) ]]
	then
		echo "Número en rango correcto. Realizando conversión..."
	else 
		echo "El numero esta fuera del rango 0-1999. No se realiza conversión." 
		exit 0
	fi
else 
	tipo=3
fi


if [ $tipo -ne 1 ] &&  [ $tipo -ne 2 ]
then
	echo "El numero introducido no corresponde a entero ni romano."
else
	if [ $tipo -eq 1 ]
	then
		romanoADecimal
	else
		decimalARomano
	fi
fi