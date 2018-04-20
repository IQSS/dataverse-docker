#!/usr/bin/env bash

# do integration-test install and test data setup

if [ ! -e /opt/dv/status ]; then
	echo "Install..."
	cd /opt/dv
	rm -rf dvinstall
	unzip dvinstall.zip
	patch -t /opt/dv/dvinstall/install < docker.patch
	cd /opt/dv/dvinstall
	/usr/local/glassfish4/glassfish/bin/asadmin start-domain

	#HEALTHCHECK CMD curl --fail http://localhost:8080/api/info/version || exit 1
	size=$(curl -sI http://localhost:8080/api/info/version | grep Content-Length|awk '{print $2}')
  	echo $size
	
	if [ ! size == '1034' ] ; then
		echo "Dataverse installation started..."
	 	./install -mailserver=$MAIL_SERVER -admin_email=$ADMIN_EMAIL -y -f > install.out 2> install.err
	fi 

        if [ "$doiprovider" == "dara-4.0" ]; then
                wget https://github.com/Dans-labs/dataverse/releases/download/4.8.6/cessda_citation.tsv -O /opt/dv/dvinstall/data/metadatablocks/citation.tsv
                wget https://github.com/Dans-labs/dataverse/releases/download/4.8.6/dataverse-4.8.6.war -O /opt/dv/dvinstall/dataverse.war
                bash /opt/dv/dara.bash
        fi

	if [ LANG != 'en' ]; then
		cd /opt/dv/deps
		echo "Applying language properties..."
		/usr/local/glassfish4/glassfish/bin/asadmin stop-domain
		sleep 10s
		cp -rf /opt/dv/$BUNDLEPROPERTIES /opt/glassfish4/glassfish/domains/domain1/applications/dataverse/WEB-INF/classes/Bundle.properties
		/usr/local/glassfish4/glassfish/bin/asadmin start-domain
	fi

	if [ ! DEBUG ]; then
		echo "Cleaning up installation files"
		rm -rf /opt/dv/*
		echo "Dataverse installed" > /opt/dv/status
	fi 
fi
