#!/bin/bash
ciudad=$1
mediaConsumo=`./cmedia.sh $ciudad`

if [ $mediaConsumo -lt 400 ]
then 
    echo "CIUDAD ECO"
else
    echo "CIUDAD NO ECO"
fi