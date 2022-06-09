#!/bin/sh

read -p "Enter input rate:" InputRate

sed -i "s/tps: [0-9]\{1,5\}/tps: $InputRate/g" benchmarking/benchmarks/scenario/simple/fabcar/config.yaml
