#!/bin/bash
cantLineas=`cat consumos.txt | wc -l`
consumoMax=0
consumoMin=1000

for i in `seq 2 $cantLineas`
do
    consumoLinea=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $4}'`

    if [ $consumoLinea -lt $consumoMin ]
    then
        consumoMin=$consumoLinea
        ciudadMin=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $1}'`
        mesMin=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $2}'`
        anyMin=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $3}'`
    fi

    if [ $consumoLinea -gt $consumoMax ]
    then
        consumoMax=$consumoLinea
        ciudadMax=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $1}'`
        mesMax=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $2}'`
        anyMax=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $3}'`
    fi
done

echo "CONSUMO MÁXIMO --> $ciudadMax , $mesMax , $anyMax."
echo "CONSUMO MÍNIMO --> $ciudadMin , $mesMin , $anyMin."
