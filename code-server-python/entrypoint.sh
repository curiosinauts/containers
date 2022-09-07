#!/bin/bash -e

set -x

sudo /etc/init.d/ssh restart

echo -e "whoami = $(whoami)"

cat << EOF > /home/coder/.config/code-server/config.yaml 
bind-addr: 0.0.0.0:9991
auth: password
password: ${VSCODE_PASSWORD:-coder}
cert: false 
EOF


dumb-init /usr/bin/code-server --bind-addr 0.0.0.0:9991 /home/coder/workspace