#!/bin/bash
export PGPASSWORD=`cat /secrets/db/password`
psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/cronjob/backup-fuction.sql
#select storageidentifier from dvobject where modificationtime>='2023-02-02';
