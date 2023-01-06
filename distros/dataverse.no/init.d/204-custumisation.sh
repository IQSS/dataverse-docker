#!/bin/bash

#curl -X PUT -d '/logos/navbar/logo.png' http://localhost:8080/api/admin/settings/:LogoCustomizationFile
#curl -X PUT -d '/tmp/custom-header.html' http://localhost:8080/api/admin/settings/:HeaderCustomizationFile
#curl -X PUT -d '/tmp/custom-footer.html' http://localhost:8080/api/admin/settings/:FooterCustomizationFile


wget https://raw.githubusercontent.com/DataverseNO/dataverse-docker/dataverse.no/distros/dataverse.no/modification/loginpage.xhtml -O /tmp/loginpage.xhtml
#wget https://raw.githubusercontent.com/DataverseNO/dataverse-docker/dataverse.no/distros/dataverse.no/modification/dataverse_header.xhtml -O /tmp/dataverse_header.xhtml 
#wget https://raw.githubusercontent.com/DataverseNO/dataverse-docker/dataverse.no/distros/dataverse.no/modification/dataverse_footer.xhtml -O /tmp/dataverse_footer.xhtml 


cp /tmp/loginpage.xhtml  /opt/payara/appserver/glassfish/domains/domain1/applications/dataverse/loginpage.xhtml
#cp /tmp/dataverse_header.xhtml  /opt/payara/appserver/glassfish/domains/domain1/applications/dataverse/dataverse_header.xhtml
#cp /tmp/dataverse_footer.xhtml  /opt/payara/appserver/glassfish/domains/domain1/applications/dataverse/dataverse_footer.xhtml

