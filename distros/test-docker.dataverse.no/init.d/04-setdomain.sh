#!/bin/bash
# Setup domain name
hostname=${hostname}
echo $hostname
hostnamecmd=dataverse.fqdn=${hostname}
echo $hostnamecmd
siteURLcmd=dataverse.siteUrl='https\:\/\/'${hostname}
echo $siteURLcmd
asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-system-properties $siteURLcmd
asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-system-properties $hostnamecmd
