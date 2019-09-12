#!/bin/bash

set -e

if [ $# != 1 ]; then
    echo 'usage: ./bootstrap.sh <VM_NAME>'
    exit 1
fi

set -x

VM_NAME=$1

sed "s@{{ vm_name }}@$VM_NAME@g" Vagrantfile.template > Vagrantfile

vagrant up