#!/bin/bash

rate=0

for ((j=1;j<=20;j++))
    do
    rate=$[$j*5]
    txPerBlock=60
    txPerSecond=$[$rate*2]

    if [ "$txPerSecond" -lt "$txPerBlock" ];then
	duration=$[800*2]
	echo "$duration"
    else
    	duration=$[800*$txPerBlock/$rate]
    fi
    
    sed -i "s/txDuration: [0-9]\{1,5\}/txDuration: $duration/g" benchmarking/benchmarks/scenario/simple/fabcar/config.yaml 
    sed -i "s/tps: [0-9]\{1,5\}/tps: $rate/g" benchmarking/benchmarks/scenario/simple/fabcar/config.yaml

    ./1_build_network.sh
    ./2_deploy_chaincode.sh
    ./3_fill_sk.sh
    ./4_run_caliper_benchmark.sh

    docker logs peer0.org1.example.com 2> logs/"$txPerBlock-2-$rate.log"
     
    cp benchmarking/report.html reports/"$txPerBlock-2-$rate.html"
   
    ./clean.sh
    
    done
echo

