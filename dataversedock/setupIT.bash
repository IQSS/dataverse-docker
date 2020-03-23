#!/usr/bin/env bash

# do integration-test install and test data setup

#if [ -e /opt/dv/$BUNDLEPROPERTIES ]; then
#    cp -rf /opt/dv/$BUNDLEPROPERTIES /opt/glassfish4/glassfish/domains/domain1/applications/dataverse/WEB-INF/classes/Bundle.properties
#fi

if [ ! -e /opt/dv/status ]; then
	cd /opt/dv
	rm -rf dvinstall
	unzip dvinstall.zip
	patch -t /opt/dv/dvinstall/install < docker.patch
	cd /opt/dv/dvinstall
	/bin/mv -f /opt/dv/dataverse.war /opt/dv/dvinstall/dataverse.war
	/opt/glassfish4/glassfish/bin/asadmin start-domain
	./install -admin_email=dataverseAdmin@mailinator.com -y -f
#> install.out 2> install.err

	cd /opt/dv/deps
	/opt/glassfish4/glassfish/bin/asadmin create-jvm-options "\-Ddataverse.siteUrl=http\:\/\/demo.dataverse.org"
	echo "Applying language properties..."
#	/opt/glassfish4/glassfish/bin/asadmin stop-domain
#	sleep 10s
#	cp -rf /opt/dv/$BUNDLEPROPERTIES /opt/glassfish4/glassfish/domains/domain1/applications/dataverse/WEB-INF/classes/Bundle.properties
#	/opt/dv/langswitch.sh >> /opt/glassfish4/glassfish/domains/domain1/applications/dataverse/WEB-INF/classes/Bundle.properties
#	/opt/glassfish4/glassfish/bin/asadmin start-domain
	curl -X PUT -d 0 http://localhost:8080/api/admin/settings/:TabularIngestSizeLimit
#	/opt/dv/dataverse-property-files/languageswitch.sh
	/opt/glassfish4/glassfish/bin/asadmin deletecreate-jvm-options "\-Ddataverse.timerServer=true"
	/opt/glassfish4/glassfish/bin/asadmin create-jvm-options "\-Ddataverse.timerServer=false"
	/opt/glassfish4/glassfish/bin/asadmin delete-jvm-options '\-Ddataverse.files.directory=/opt/glassfish4/glassfish/domains/domain1/files'
	/opt/glassfish4/bin/asadmin create-jvm-options '\-Ddataverse.files.directory=/opt/glassfish4/glassfish/domains/domain1/docroot/files'

#	echo "Cleaning up installation files"
#	rm -rf /opt/dv/*
	echo "Dataverse installed" > /opt/dv/status
fi
