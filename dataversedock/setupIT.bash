#!/usr/bin/env bash

# do integration-test install and test data setup

if [ ! -e /opt/dv/status ]; then
	cd /opt/dv
	rm -rf dvinstall
	unzip dvinstall.zip
	patch -t /opt/dv/dvinstall/install < docker.patch
	cd /opt/dv/dvinstall
	if [ "$doiprovider" == "dara-4.0" ]; then
		wget https://github.com/Dans-labs/dataverse/releases/download/4.8.6/cessda_citation.tsv -O /opt/dv/dvinstall/data/metadatablocks/citation.tsv
	fi

	/usr/local/glassfish4/glassfish/bin/asadmin start-domain
	./install -admin_email=pameyer+dvinstall@crystal.harvard.edu -y -f 
#> install.out 2> install.err

	cd /opt/dv/deps
	echo "Applying language properties..."
	/usr/local/glassfish4/glassfish/bin/asadmin stop-domain
	sleep 10s
	cp -rf /opt/dv/$BUNDLEPROPERTIES /opt/glassfish4/glassfish/domains/domain1/applications/dataverse/WEB-INF/classes/Bundle.properties
	/usr/local/glassfish4/glassfish/bin/asadmin start-domain
	echo "Cleaning up installation files"
	rm -rf /opt/dv/*
	echo "Dataverse installed" > /opt/dv/status
fi
