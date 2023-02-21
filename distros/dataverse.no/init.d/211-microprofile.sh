#!/bin/bash
wget https://raw.githubusercontent.com/DataverseNO/dataverse-docker/dataverse.no/distros/dataverse.no/configs/microprofile-config.properties -O /tmp/microprofile-config.properties
cp /tmp/microprofile-config.properties /opt/payara/appserver/glassfish/domains/domain1/applications/dataverse/WEB-INF/classes/META-INF/microprofile-config.properties
touch /opt/payara/appserver/glassfish/domains/domain1/applications/dataverse/.reload
