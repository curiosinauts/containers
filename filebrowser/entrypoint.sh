#!/bin/bash -e
set -x

cd /home/debian
if test -f "/home/debian/filebrowser.db"    
then
    dumb-init /usr/local/bin/filebrowser
else
    filebrowser config init
    filebrowser config set --address 0.0.0.0
    filebrowser config set --root ${ROOT_DIR} 
    filebrowser users add admin ${ADMIN_PASSWORD} --perm.admin
    dumb-init /usr/local/bin/filebrowser 
fi