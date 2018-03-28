#!/usr/bin/env bash

# do integration-test install and test data setup

if [ ! -e /opt/dv/status ]; then
 	cd /opt/dv/deps
	unzip dara-dv-plugin.zip
	cd /opt/dv
	rm -rf dvinstall
	unzip dvinstall.zip
	cp -rf /opt/dv/deps/dataverse.war /opt/dv/dvinstall/dataverse.war
	patch -t /opt/dv/dvinstall/install < docker.patch
	cd /opt/dv/dvinstall
	/usr/local/glassfish4/glassfish/bin/asadmin start-domain
	./install -admin_email=pameyer+dvinstall@crystal.harvard.edu -y -f 
#> install.out 2> install.err

	cd /opt/dv/deps
	echo "Applying language properties..."
	/usr/local/glassfish4/glassfish/bin/asadmin stop-domain
	sleep 10s
	cp -rf /opt/dv/$BUNDLEPROPERTIES /opt/glassfish4/glassfish/domains/domain1/applications/dataverse/WEB-INF/classes/Bundle.properties
	/usr/local/glassfish4/glassfish/bin/asadmin start-domain
	/opt/dv/dara.bash
#	echo "Cleaning up installation files"
#	rm -rf /opt/dv/*
	echo "Dataverse installed" > /opt/dv/status
fi
