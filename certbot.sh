#!/bin/sh

set -e
set -u

if [[ $# -lt 1 ]]; then
    echo $0 your_email [hostname]
fi

email=$1
domain=$(hostname)
domain=${2:$domain}

certbot certonly --standalone -m $email -d $domain
