#!/bin/bash

# 
#


#docker exec --user postgres postgres pg_dump -U dataverse dataverse > /mnt/dataverse.dump
#gzip -f /mnt/dataverse.dump

# dump databases
docker exec --user postgres postgres pg_dump -U dataverse dataverse | gzip > /mnt/dataverse.dump.gz
#docker exec --user postgres postgres pg_dump -h ${DATAVERSE_DB_HOST} -U ${DATAVERSE_DB_USER} ${POSTGRES_DATABASE} | gzip > /mnt/dataverse.dump.gz

#cp /mnt/dataverse.dump.gz /mntblob/data/databaseDumps/dataverse.`date +%Y%m%d_%H%M%z`.dump.gz
rsync -arvP --rsh=ssh /mnt/dataverse.dump.gz DVmtr-cmp01:/tmp/dataverse.dump.gz

docker exec dataverse /opt/payara/init.d/cronjob/backupData.sh

rm /mnt/dataverse.dump.gz