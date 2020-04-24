#!/bin/sh

# $1 = domainname
# $2 = private key
# $3 = cert /scratch/services/dehydrated/certs/.../cert.pem
# $4 = fullchain /scratch/services/dehydrated/certs/.../fullchain.pem
# $5 = ca chain /scratch/services/dehydrated/certs/.../chain.pem
# $6 = timestamp 1505868437

# kick all the nginx's to get it to reload the new certs.
docker ps | awk '/nginx/ {print $1}'  | xargs docker kill -s HUP
