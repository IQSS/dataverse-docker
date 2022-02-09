#!/bin/bash

# Setup DOI parameters 
# https://guides.dataverse.org/en/latest/installation/config.html#doi-baseurlstring
if [ "${doi_authority}" ]; then
    curl -X PUT -d ${doi_authority} http://localhost:8080/api/admin/settings/:Authority
    curl -X PUT -d ${doi_provider} http://localhost:8080/api/admin/settings/:DoiProvider
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddoi.username\=${doi_username}"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddoi.password\=${doi_password}"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddoi.dataciterestapiurlstring\=${dataciterestapiurlstring}"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddoi.baseurlstring\=${baseurlstring}"
    if [ "${doi_shoulder}" ]; then
        curl -X PUT -d "${doi_shoulder}/" "$SERVER/admin/settings/:Shoulder"
    fi
fi
