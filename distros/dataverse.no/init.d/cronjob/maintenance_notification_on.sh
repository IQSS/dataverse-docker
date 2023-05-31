#! /bin/bash
curl -H "Content-type:application/json" -X POST http://localhost:8080/api/admin/bannerMessage --upload-file ${INIT_SCRIPTS_FOLDER}/cronjob/maintenance_notification.json

# 0 16 * * 3 /usr/bin/docker exec dataverse "/opt/payara/init.d/cronjob/maintenance_notification_on.sh"
