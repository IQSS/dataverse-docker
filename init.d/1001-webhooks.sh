#!/bin/bash

# Running python script to invoke webhooks
if [ "${WEBHOOK}" ]; then
    PGPASSWORD=${POSTGRES_PASSWORD};export PGPASSWORD
    psql -U ${POSTGRES_USER} ${POSTGRES_DATABASE} -h ${POSTGRES_SERVER} -f ${HOME_DIR}/triggers/external-service.sql
    /usr/bin/python3.6 ${WEBHOOK} &
    echo 'Setting webhook on ' + ${WEBHOOK} >> /tmp/status.log
fi
