#!/bin/bash

set -e

fix_firehol_kernel_issue() {
  apt-get install -qy linux-image-5.4.0-91-generic linux-headers-5.4.0-91-generic linux-modules-extra-5.4.0-91-generic
  update_grub

  # Install the hardware raid controller driver
  local driver_dkms_url=https://github.com/lins05/smartpqi-dkms/releases/download/2.1.14.035/smartpqi-dkms_2.1.14.035_all.deb
  local fname=$(basename $driver_dkms_url)
  wget $driver_dkms_url -O /tmp/$fname
  apt-get install -qy build-essential dkms
  dpkg -i /tmp/$fname
}

fix_firehol_kernel_issue
