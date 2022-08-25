#!/bin/bash

RED='\e[0;31m'
GREEN='\e[0;32m'
NC='\e[0m'

COLOR=$RED

NGINX_CONF=/etc/nginx/sites-available

if [ $1 == 'on' ]
then
	COLOR=$GREEN
fi

if [ $1 == 'on' ] || [ $1 == 'off' ]
then
	sed -i -E "/autoindex/ s/on|off/$1/" $NGINX_CONF/nginx.conf
	nginx -s reload
	echo -e "Set autoindex to: $COLOR$1$NC"
else
	echo "Option must be \"on\" or \"off\"."
fi
