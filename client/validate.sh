#!/bin/bash 

docker exec -dit client bash 
if [ "$(yum list installed | grep httpd)" ]; then
   echo "httpd exist"
else 
   echo "httpd not exist"
fi

exit 



