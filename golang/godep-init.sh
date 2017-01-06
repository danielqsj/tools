#!/usr/bin/env bash

output="$(godep save 2>&1 1>/dev/null)"

while [[ ${output} ]]
do
    echo "output is ${output}"
    pkg="$(echo ${output}|cut -d '(' -f2|cut -d ')' -f1)"
    echo "go get ${pkg}"
    `go get ${pkg}`
    output="$(godep save 2>&1 1>/dev/null)"
done