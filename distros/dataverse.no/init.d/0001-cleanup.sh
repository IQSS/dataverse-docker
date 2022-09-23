#!/bin/bash/
if [ -f /tmp/cleanup.sql ]
then
	export PGPASSWORD=`cat /secrets/db/password`
	psql -U dataverse dataverse -h postgres -f /tmp/cleanup.sql
	mv /tmp/cleanup.sql /tmp/cleanup.sql-used
fi
