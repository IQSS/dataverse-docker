#!/bin/bash
export PGPASSWORD=`cat /secrets/db/password`
pg_dump -U dataverse dataverse -h postgres -t actionlogrecord > /tmp/actionlogrecord$(date +'%Y%m%d').dump
gzip --force /tmp/actionlogrecord$(date +'%Y%m%d').dump
psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/cronjob/actionlog/actionlogrecord.sql


