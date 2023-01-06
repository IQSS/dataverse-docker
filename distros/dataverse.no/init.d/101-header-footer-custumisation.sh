#!/bin/bash

wget https://raw.githubusercontent.com/DataverseNO/dataverse-docker/dataverse.no/distros/dataverse.no/modification/custom-header.html -O /tmp/custom-header.html    
wget https://raw.githubusercontent.com/DataverseNO/dataverse-docker/dataverse.no/distros/dataverse.no/modification/custom-footer.html -O /tmp/custom-footer.html

curl -X PUT -d '/logos/navbar/logo.png' http://localhost:8080/api/admin/settings/:LogoCustomizationFile
curl -X PUT -d '/tmp/custom-header.html' http://localhost:8080/api/admin/settings/:HeaderCustomizationFile
curl -X PUT -d '/tmp/custom-footer.html' http://localhost:8080/api/admin/settings/:FooterCustomizationFile
