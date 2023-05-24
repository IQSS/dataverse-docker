#! /bin/bash
curl -H "Content-type:application/json" -X POST http://localhost:8080/api/admin/bannerMessage --upload-file ${INIT_SCRIPTS_FOLDER}/cronjob/maintenance_notification.json
