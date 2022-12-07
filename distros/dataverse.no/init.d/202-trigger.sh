#!/bin/bash
python3 ${INIT_SCRIPTS_FOLDER}/affiliations/affiliation2data.py > /tmp/affiliations.sql
export PGPASSWORD=`cat /secrets/db/password`
psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/builtinuser_trigger.sql
psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/builtinuser_trigger.sql.2
psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/groupuser_trigger.sql
psql -U dataverse dataverse -h postgres  -f /tmp/affiliations.sql
