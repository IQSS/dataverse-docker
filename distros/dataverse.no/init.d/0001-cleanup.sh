#!/bin/bash/
if [ -f /mnt/tmp/cleanup.sql ]
then
	export PGPASSWORD=`cat /secrets/db/password`
	psql -U dataverse dataverse -h postgres -f /mnt/tmp/cleanup.sql
	mv /mnt/tmp/cleanup.sql /mnt/tmp/cleanup.sql-used
fi
