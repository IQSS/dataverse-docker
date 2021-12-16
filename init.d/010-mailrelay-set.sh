#!/bin/bash

# Setup mail relay
# https://guides.dataverse.org/en/latest/developers/troubleshooting.html
if [ "${system_email}" ]; then
    curl -X PUT -d ${system_email} http://localhost:8080/api/admin/settings/:SystemEmail
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} delete-javamail-resource mail/notifyMailSession
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-javamail-resource --mailhost ${mailhost} --mailuser ${mailuser} --fromaddress ${no_reply_email} --property mail.smtp.auth=false:mail.smtp.password=${smtp_password}:mail.smtp.port=${smtp_port}:mail.smtp.socketFactory.port=${socket_port}:mail.smtp.socketFactory.fallback=false mail/notifyMailSession
fi
