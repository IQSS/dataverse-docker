#!/bin/bash
if [ $# -eq 0 ]
	then
		echo "Usage : restart-dataverse.sh [dataverse adress] [distrib location(optional)]"
		exit 1
	fi

# Check if Dataverse is online
healthcheck="/tmp/healthcheck.log"
restartpid='/tmp/restart.pid'
rm $healthcheck
DATAVERSE=$1 #'https://test-docker.dataverse.no'
DISTRIB=${2:-'/distrib'}
DELAY=15
echo $DATAVERSE

curl -s ${DATAVERSE}/api/dataverses/root|grep "name" >> $healthcheck

cat $healthcheck

if test "`find $restartpid -mmin +15 -print 2>/dev/null`"
	then
		echo "${restartpid} is too old, deleting, this may lead to an other restart"
		rm $restartpid
     	fi	     


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
	     cd ${DISTRIB}/dataverse-docker
	     echo "down"
             /usr/local/bin/docker-compose down
	     echo "waiting ${DELAY}s for ${DATAVERSE} to go down"
             sleep $DELAY
	     echo "up"
             /usr/local/bin/docker-compose up -d
	fi
fi
