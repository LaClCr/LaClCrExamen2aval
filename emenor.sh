#!/bin/bash
ciudades=`cat consumos.txt | tail -n+2 | awk '{print $1}' | sort | uniq > ciudadesDistintas.txt`
cantLineas=`cat ciudadesDistintas.txt | wc -l`

for i in `seq  $cantLineas`
do
    ciudad=`cat ciudadesDistintas.txt | tail -n+$i | head -n1`
    echo "Media de consumo de $ciudad:"
    ./cmedia.sh $ciudad
done