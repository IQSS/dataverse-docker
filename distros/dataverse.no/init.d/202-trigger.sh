#!/bin/bash
python3 ./affiliations/affiliation2data.py > /tmp/affiliations.sql
export PGPASSWORD=`cat /secrets/db/password`
psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/extratrigger.sql
psql -U dataverse dataverse -h postgres  -f /tmp/affiliations.sql
