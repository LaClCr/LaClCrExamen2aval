#!/bin/bash
cantLineas=`cat consumos.txt | wc -l`
ciudadIntroducida=$1
sumaConsumo=0
contador=0
media=0

for i in `seq 2 $cantLineas`
do
ciudadFichero=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $1}'`
consumoFichero=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $4}'`

    if [ $ciudadIntroducida == $ciudadFichero ] 
    then
        sumaConsumo=$(($sumaConsumo + $consumoFichero))
        contador=$(($contador + 1))
    fi
done

media=$(($sumaConsumo / $contador))

echo "Media de consumo de $ciudadIntroducida ---> $media"