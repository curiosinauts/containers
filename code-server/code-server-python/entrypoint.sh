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

export DEFAULT_VALUE="vscode-${VSCODE_USERNAME}.curiosityworks.org"

export VSCODE_HOST=${VSCODE_HOST:-"${DEFAULT_VALUE}"}

dumb-init /usr/bin/code-server --bind-addr 0.0.0.0:9991 /home/coder/workspace