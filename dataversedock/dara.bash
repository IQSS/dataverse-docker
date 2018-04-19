#!/bin/bash
if [ "$doiprovider" == "dara-4.0" ]; then
    echo "Initializing da-ra service for PIDs registration..."
    cd /opt/dv/deps
    unzip dara-dv-plugin.zip
    curl http://localhost:8080/api/admin/datasetfield/load -X POST --data-binary @/opt/dv/deps/dara40.tsv -H "Content-type: text/tab-separated-values"
    /opt/glassfish4/glassfish/bin/asadmin add-library /opt/dv/deps/dara-dv-plugin/target/dara-plugin-1.0-SNAPSHOT-jar-with-dependencies.jar
    psql -U dvnapp dvndb -h db -f /opt/dv/actionlog.sql

    curl -X PUT -d $doiprovider http://localhost:8080/api/admin/settings/:DoiProvider
    curl -X PUT -d $authority http://localhost:8080/api/admin/settings/:Authority
    curl -X PUT -d $DOIseparator http://localhost:8080/api/admin/settings/:DoiSeparator
    thishost=uname -a|awk '{print $2}'
    /opt/glassfish4/glassfish/bin/asadmin delete-jvm-options -Ddataverse.fqdn=$thishost
    /opt/glassfish4/glassfish/bin/asadmin delete-jvm-options  '-Ddoi.baseurlstring=https\://ezid.cdlib.org'
    /opt/glassfish4/glassfish/bin/asadmin create-jvm-options '-Ddoi.baseurlstring="http\://labs.da-ra.de"'
    /opt/glassfish4/glassfish/bin/asadmin create-jvm-options -Ddataverse.fqdn=$SITEURL
    /opt/glassfish4/glassfish/bin/asadmin create-jvm-options -Ddataverse.siteUrl=https://$SITEURL
    /opt/glassfish4/glassfish/bin/asadmin delete-jvm-options -Ddoi.username=apitest
    /opt/glassfish4/glassfish/bin/asadmin delete-jvm-options -Ddoi.password=apitest
    /opt/glassfish4/glassfish/bin/asadmin create-jvm-options -Ddoi.username="$login":-Ddoi.password="$password"
    /opt/glassfish4/glassfish/bin/asadmin stop-domain
    /opt/glassfish4/glassfish/bin/asadmin start-domain
fi
