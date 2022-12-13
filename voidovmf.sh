#!/bin/bash
mkdir /tmp/ovmf_package
cd /tmp/ovmf_package
wget --trust-server-names https://archlinux.org/packages/extra/any/edk2-ovmf/download/
tar -xvf edk2-ovmf-*
sudo install -D -m 0644 -t /usr/share/edk2-ovmf/x64 usr/share/edk2/x64/*
sudo install -D -m 0644 -t /usr/share/edk2-ovmf/ia32 usr/share/edk2/ia32/*
sed -i -e 's@usr/share/edk2@/usr/share/ovmf@g' usr/share/qemu/firmware/*.json
sudo install -D -m 0644 -t /etc/qemu/firmware usr/share/qemu/firmware/*

