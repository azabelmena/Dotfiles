#!/usr/bin/env bash

for i in $(seq 1 $1)
do
    touch section$i.tex
done
