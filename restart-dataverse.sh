#!/bin/bash

# Check if Dataverse is online
healthcheck="/tmp/healthcheck.log"
restartpid='/tmp/restart.pid'
rm $healthcheck
DATAVERSE='https://test-docker.dataverse.no'
DATAVERSETMP='https://test-docker1.dataverse.no'
#DATAVERSE=${DATAVERSETMP}
#DATAVERSE='https://demo.dataverse.no'

curl ${DATAVERSE}/api/dataverses/root|grep "description" >> $healthcheck
DELAY=15

if [ -s $healthcheck ];
then
	rm $restartpid
        echo "Dataverse ${DATAVERSE} is running. "
else
        echo "Dataverse ${DATAVERSE} is stopped"
        if [ -s $restartpid ];
	then
             echo "Dataverse is restarting..."
        else
	     echo 'restarting...' > $restartpid
	     date >> /mntblob/logs/restart.log
	     cd /distrib/dataverse-docker
             /usr/local/bin/docker-compose down
             sleep $DELAY
             /usr/local/bin/docker-compose up -d
	fi
fi
