#!/usr/bin/env bash

if [ ! -e "/opt/glassfish4/glassfish/domains/domain1/applications/dataverse/WEB-INF/classes/Bundle.properties" ]; then
	cd /opt/dv
	./setupIT.bash
fi

# star R
/usr/bin/R CMD Rserve --quiet --vanilla --RS-conf /etc/Rserv.conf --RS-pidfile /var/run/rserve/rserve.pid

cd /opt/glassfish4
bin/asadmin stop-domain
bin/asadmin start-domain
sleep infinity

