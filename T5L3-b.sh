#!/bin/bash
num=$1
comprobador='^-?[0-9]+([.][0-9]+)?$' 

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
		. romanoADecimal.sh $num
	else
		. decimalARomano.sh $num
	fi
fi