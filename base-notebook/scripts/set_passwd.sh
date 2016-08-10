#!/usr/bin/env bash

echo "root:root" | chpasswd
echo "epinux:epinux" | chpasswd
echo "epinux     ALL=(ALL:ALL) ALL" >> /etc/sudoers