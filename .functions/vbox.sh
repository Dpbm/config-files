#!/bin/bash

fix_kvm_vmx_root_mode(){
  set +e
  set -x

  # from https://superuser.com/questions/1845776/virtualbox-cant-operate-in-vmx-mode
  
  sudo rmmod kvm_intel
  sudo rmmod kvm


  echo "blacklist kvm" | sudo tee -a /etc/modprobe.d/blacklist.conf
  echo "blacklist kvm_intel" | sudo tee -a /etc/modprobe.d/blacklist.conf

  sudo update-initramfs -u

  echo "Now you need to reboot to make it work!"
}

fix_vbox_memory(){
  # refer to: https://forums.virtualbox.org/viewtopic.php?t=112438
  echo 3 | sudo tee /proc/sys/vm/drop_caches 
}

fix_kvm_not_found(){
  # refer to: https://askubuntu.com/questions/564910/kvm-is-not-installed-on-this-machine-dev-kvm-is-missing
  sudo modprobe kvm_intel
}
