#!/bin/bash
mkdir /mntblob/databaseDumps/
chown omsagent /mntblob/databaseDumps/
usermod -aG docker omsagent
cp -r /distib/private/.ssh /var/opt/microsoft/omsagent/run
chown -R omsagent /var/opt/microsoft/omsagent/run/.ssh
#0 1 * * * /usr/bin/docker exec dataverse "/opt/payara/init.d/cronjob/backupData.sh" >> /var/log/bakupslogs.log
#0 0 * * * /distrib/dataverse-docker/distros/dataverse.no/init.d/cronjob/dumpdatabase.sh
#*/2 * * * * /bin/bash /distrib/dataverse-docker/restart-dataverse.sh https://dataverse.no >> /var/log/restartlogs.log
#0 16 * * 3 /usr/bin/docker exec dataverse "/opt/payara/init.d/cronjob/maintenance_notification_on.sh"
#0 06 * * 4 su root /distrib/dataverse-docker/update.sh
#30 06 * * 4 /usr/bin/docker exec dataverse "/opt/payara/init.d/cronjob/maintenance_notification_off.sh"
#0 21 * * * docker exec dataverse bash -c "curl -X POST http://localhost:8080/api/admin/sitemap"
