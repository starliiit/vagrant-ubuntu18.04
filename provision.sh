#!/bin/bash -xe

if [ $EUID != 0 ]; then
    echo "This script must be run as root, use sudo $0 instead" 1>&2
    exit 1
fi

export PROVISION_DIR=/vagrant
export USER=vagrant


### fix slow DNS
systemctl stop systemd-resolved.service
systemctl disable systemd-resolved.service
rm -f /etc/resolv.conf
cp $PROVISION_DIR/configs/resolv.conf /etc/resolv.conf


### use Aliyun mirrors
cp $PROVISION_DIR/configs/sources.list /etc/apt/sources.list
apt update && apt install -y curl

### dependencies
apt install -y python3-pip python3-venv
