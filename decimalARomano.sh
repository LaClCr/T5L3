#!/bin/bash
dec=( 1000 900 500 400 100 90 50 40 10 9 5 4 1 ) 
rom=( M CM D CD C XC L XL X IX V IV I ) 
aux=$1 
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

echo "El equivalente en numeros romanos a $1 es $result"
