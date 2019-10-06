#!/bin/bash -e 

install -m 644 files/hoobs.service "${ROOTFS_DIR}/etc/systemd/system/"

on_chroot << EOF
# install hoobs-core
yarn global add --unsafe-perm --ignore-engines @hoobs/hoobs

# grant hoobs user password-less sudo
echo 'hoobs    ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

systemctl daemon-reload
systemctl enable hoobs
EOF
