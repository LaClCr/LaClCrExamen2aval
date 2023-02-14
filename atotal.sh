#!/bin/bash
cantLineas=`cat consumos.txt | wc -l`
ciudadIntroducida=""
ciudadFichero=""
consumoTotal=0
contieneCiudad=0

while [ $contieneCiudad -eq 0 ]; do

    echo "Introduce el nombre de la ciudad para ver su consumo: "
    read ciudadIntroducida

    for i in `seq 2 $cantLineas`
    do
    ciudadFichero=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $1}'`
    consumoFichero=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $4}'`

        if [ $ciudadIntroducida == $ciudadFichero ] 
        then
        consumoTotal=$(($consumoTotal + $consumoFichero))   
        contieneCiudad=1
        fi
    done
done

echo "El consumo total de la ciudad de $ciudadIntroducida es de $consumoTotal"