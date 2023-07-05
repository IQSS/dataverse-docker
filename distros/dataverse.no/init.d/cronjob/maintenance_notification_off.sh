#! /bin/bash

curl -X DELETE http://localhost:8080/api/admin/bannerMessage/$(curl -s -X GET http://localhost:8080/api/admin/bannerMessage | jq -r 'first(.data[]|select(.displayValue | contains("due to regular maintenance")).id)')

# 30 06 * * 4 /usr/bin/docker exec dataverse "/opt/payara/init.d/cronjob/maintenance_notification_off.sh"
