#!/bin/bash
ciudades=`cat consumos.txt | tail -n+2 | awk '{print $1}' | sort | uniq > ciudadesDistintas.txt`
cantCiudades=`cat ciudadesDistintas.txt | wc -l`

for i in `seq 1 $cantCiudades`
do
    ciudad=`cat ciudadesDistintas.txt | tail -n+$i | head -n1`
    cantLineasCiudad=`cat consumos.txt | grep $ciudad | wc -l`
    consumoMin=1000

    for j in `seq 1 $cantLineasCiudad`
    do        
        consumo=`cat consumos.txt | grep $ciudad | tail -n+$j | head -n1 | awk '{print $4}'`
        if [ $consumo -ge $consumoMin ]
        then
            ciudadNoDecreciente=$ciudad
            break
        elif [ $consumo -lt $consumoMin ]
        then
            consumoMin=$consumo
        fi        
    done

done

ciudadesDecrecientes=`cat ciudadesDistintas.txt | grep -v $ciudadNoDecreciente`
echo $ciudadesDecrecientes