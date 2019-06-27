#!/bin/sh

set -u
set -e

domain=$(hostname)

mkdir -p /home/rancher2/auditlog
mkdir -p /home/rancher2/var-lib-rancher

docker run -d --restart=unless-stopped --name rancher  \
        -v /etc/letsencrypt/live/${domain}/fullchain.pem:/etc/rancher/ssl/cert.pem:ro \
	-v /etc/letsencrypt/live/${domain}/privkey.pem:/etc/rancher/ssl/key.pem:ro \
        -v /home/rancher2/auditlog:/var/log/auditlog \
	-v /home/rancher2/var-lib-rancher:/var/lib/rancher \
        -p 8080:80 -p 443:443 \
	rancher/rancher \
	--no-cacerts  $@


if [ $? = 0 ]; then
	docker logs -f rancher 
fi 

