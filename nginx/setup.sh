#!/bin/bash
# Install nginx and hold SSH until it is up.
#
# runlab saves a snapshot when SSH accepts a connection. Ordering SSH
# after nginx.service means that snapshot already has the server listening.
# ssh.socket would accept the connection before that order applies.
set -euo pipefail
trap '' HUP

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y nginx

if ! systemctl cat nginx.service >/dev/null 2>&1; then
  echo "nginx.service is missing" >&2
  exit 1
fi

if systemctl cat ssh.service >/dev/null 2>&1; then
  ssh_unit=ssh.service
elif systemctl cat sshd.service >/dev/null 2>&1; then
  ssh_unit=sshd.service
else
  echo "no ssh service on this image" >&2
  exit 1
fi

mkdir -p "/etc/systemd/system/${ssh_unit}.d"
cat > "/etc/systemd/system/${ssh_unit}.d/nginx.conf" << EOF
[Unit]
After=nginx.service
Requires=nginx.service
EOF

systemctl daemon-reload
systemctl enable nginx.service
systemctl enable "$ssh_unit"
systemctl disable ssh.socket || true
