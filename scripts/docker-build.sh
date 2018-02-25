#!/bin/bash

PWD=`pwd`
BASE=$(dirname $PWD)
MSDIR=$BASE/microservice-demo

LIST=(`ls -l  | grep ^d | awk '{print $NF}'`)

for i in ${LIST[*]}; do 
    IMAGE="linuxautomations/$i"
    IMAGE=$(echo $IMAGE | sed -e 's/microservice-demo/ms/')
    cd $MSDIR/$i 
    docker build -t $IMAGE .
done