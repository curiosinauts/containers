#!/bin/bash -e

rm /etc/nginx/sites-enabled/default

set -x

nginx -g 'daemon off;'