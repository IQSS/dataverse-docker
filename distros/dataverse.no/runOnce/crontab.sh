#!/bin/bash
mkdir /mntblob/databaseDumps/
chown omsagent /mntblob/databaseDumps/
usermod -aG docker omsagent
cp -r /distib/private/.ssh /var/opt/microsoft/omsagent/run
chown -R omsagent /var/opt/microsoft/omsagent/run/.ssh
#0 0 * * * /usr/bin/docker exec dataverse "/opt/payara/init.d/cronjob/backupData.sh" >> /var/log/bakupslogs.log
#0 0 * * * /usr/bin/docker exec dataverse "/opt/payara/init.d/cronjob/backupData.sh" >> /var/log/bakupslogs.log
#1 0 * * * /distrib/dataverse-docker/distros/dataverse.no/init.d/cronjob/dumpdatabase.sh
#*/3 * * * * /bin/bash /distrib/dataverse-docker/restart-dataverse.sh https://dataverse.no

