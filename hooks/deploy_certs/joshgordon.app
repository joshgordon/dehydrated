#!/bin/sh

# $1 = domainname
# $2 = private key
# $3 = cert /scratch/services/dehydrated/certs/.../cert.pem
# $4 = fullchain /scratch/services/dehydrated/certs/.../fullchain.pem
# $5 = ca chain /scratch/services/dehydrated/certs/.../chain.pem
# $6 = timestamp 1505868437

scp $2 root@bitwarden.joshgordon.app:/scratch/bitwarden/bwdata/ssl
scp $4 root@bitwarden.joshgordon.app:/scratch/bitwarden/bwdata/ssl
ssh root@bitwarden.joshgordon.app restorecon -r /scratch/bitwarden/bwdata/ssl
ssh root@bitwarden.joshgordon.app docker kill --signal HUP bitwarden-nginx
