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

cat << EOF > /home/coder/.local/bin/gotty.sh
#!/bin/sh
export TERM=xterm
/usr/local/bin/gotty --ws-origin "${VSCODE_HOST}" -p 2222 -c "${VSCODE_USERNAME}:${VSCODE_PASSWORD}" -w /usr/bin/zsh >>/dev/null 2>&1 
EOF
chmod +x /home/coder/.local/bin/gotty.sh
nohup /home/coder/.local/bin/gotty.sh &


dumb-init /usr/bin/code-server --bind-addr 0.0.0.0:9991 /home/coder/workspace