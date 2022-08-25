#!/bin/bash

# Remove temp files
rm -rf /app/temp

# Start Services
echo "We are in bizness bb"

service mysql start
service php7.3-fpm start
# Starts nginx not daemonized so that the container stays up
nginx -g "daemon off;"
