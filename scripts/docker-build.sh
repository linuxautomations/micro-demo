#!/bin/bash

docker login -u rkalluru -p osicpl@1
PWD=`pwd`
BASE=$(dirname $PWD)
MSDIR=$BASE/microservice-demo

LIST=(`ls -l $MSDIR | grep ^d | awk '{print $NF}'`)

for i in ${LIST[*]}; do 
    IMAGE="linuxautomations/$i"
    IMAGE=$(echo $IMAGE | sed -e 's/microservice-demo/ms/')
    cd $MSDIR/$i 
    echo "Building Image :: $IMAGE"
    docker build -t $IMAGE . &>/dev/null 
    docker push $IMAGE  &>/dev/null
done

