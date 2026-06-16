#!/bin/bash

NUM1=100
NUM2=300 ## if we declare here something as string by default it consdires as 0

SUM=$(($NUM1+$NUM2))

echo "Sum is :: $SUM"


#Arrays

Fruits=("Apple" "Bannana" "Pomo")
echo "Fruits are :: ${Fruits[@]}"

#Indexing

echo "first fruit is :: ${Fruits[0]}"
echo "second fruit is :: ${Fruits[1]}"
echo "third fruit is :: ${Fruits[2]}"