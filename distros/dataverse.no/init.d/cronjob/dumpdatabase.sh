#!/bin/bash
docker exec --user postgres postgres pg_dump -U dataverse dataverse > /mnt/dataverse.dump
gzip -f /mnt/dataverse.dump
cp /mnt/dataverse.dump.gz /mntblob/data/databaseDumps/dataverse.`date +%Y%m%d`.dump.gz
rsync -arvP --rsh=ssh /mnt/dataverse.dump.gz DVmtr-cmp01:/tmp/dataverse.dump.gz

