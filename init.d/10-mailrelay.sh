# Setup mail relay
# https://guides.dataverse.org/en/latest/developers/troubleshooting.html
curl -X PUT -d ${system_email} http://localhost:8080/api/admin/settings/:SystemEmail
asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} delete-javamail-resource mail/notifyMailSession
asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-javamail-resource --mailhost smtp-relay.uit.no --mailuser no-reply@dataverse.no --fromaddress ${no_reply_email} --property mail.smtp.auth=false:mail.smtp.password=${smpt_password}:mail.smtp.port=${smpt_port}:mail.smtp.socketFactory.port=${socket_port}:mail.smtp.socketFactory.fallback=false mail/notifyMailSession

