#! /bin/bash
apt-get update -y && apt-get dist-upgrade -y &&  apt-get autoremove -y &&  apt-get clean -y && apt-get autoclean -y
[ -e /var/run/reboot-required ] && reboot

# 0 04 * * 4 /distrib/dataverse-docker/update.sh
