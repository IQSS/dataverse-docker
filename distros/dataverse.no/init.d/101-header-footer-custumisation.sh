#!/bin/bash

wget https://raw.githubusercontent.com/DataverseNO/dataverse-docker/dataverse.no/distros/dataverse.no/modification/dataverse_header.xhtml -O /tmp/custom-header.xhtml    
wget https://raw.githubusercontent.com/DataverseNO/dataverse-docker/dataverse.no/distros/dataverse.no/modification/dataverse_footer.xhtml -O /tmp/custom-footer.xhtml

curl -X PUT -d '/logos/navbar/logo.png' http://localhost:8080/api/admin/settings/:LogoCustomizationFile
curl -X PUT -d '/tmp/custom-header.html' http://localhost:8080/api/admin/settings/:HeaderCustomizationFile
curl -X PUT -d '/tmp/custom-footer.html' http://localhost:8080/api/admin/settings/:FooterCustomizationFile
