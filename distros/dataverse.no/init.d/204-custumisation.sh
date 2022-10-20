#!/bin/bash

wget https://raw.githubusercontent.com/DataverseNO/dataverse-docker/dataverse.no/distros/dataverse.no/modification/loginpage.xhtml -O /tmp/loginpage.xhtml
wget https://raw.githubusercontent.com/DataverseNO/dataverse-docker/dataverse.no/distros/dataverse.no/modification/dataverse_header.xhtml -O /tmp/dataverse_header.xhtml 
wget https://raw.githubusercontent.com/DataverseNO/dataverse-docker/dataverse.no/distros/dataverse.no/modification/dataverse_footer.xhtml -O /tmp/dataverse_footer.xhtml 


cp /tmp/loginpage.xhtml  /opt/payara/appserver/glassfish/domains/domain1/applications/dataverse/loginpage.xhtml
cp /tmp/dataverse_header.xhtml  /opt/payara/appserver/glassfish/domains/domain1/applications/dataverse/dataverse_header.xhtml
cp /tmp/dataverse_footer.xhtml  /opt/payara/appserver/glassfish/domains/domain1/applications/dataverse/dataverse_footer.xhtml

