#!/bin/bash
useradd -d /home/user -m -s /bin/bash -p $(echo "samsung" | openssl passwd -1 --stdin) user
usermod -p $(echo "samsung" | openssl passwd -1 --stdin) root
echo "root:samsung" | chpasswd
sed -i '/PermitRootLogin/d' /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
