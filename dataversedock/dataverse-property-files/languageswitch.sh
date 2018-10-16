#!/bin/bash

# Compiling bundle properties with metadata
/usr/local/glassfish4/glassfish/bin/asadmin create-jvm-options "\-Ddataverse.lang.directory=/opt/dv"
/bin/cp -f /opt/dv/metadataFragment.xhtml /opt/glassfish4/glassfish/domains/domain1/applications/dataverse/metadataFragment.xhtml
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/se-SE > /opt/dv/Bundle_se.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/sl-SI > /opt/dv/Bundle_sl.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/de-AT > /opt/dv/Bundle_de.properties
/opt/dv/dataverse-property-files/lang-integrator.py /opt/dv/dataverse-property-files/fr-FR > /opt/dv/Bundle_fr.properties

curl http://localhost:8080/api/admin/settings/:Languages -X PUT -d '[{ "locale":"en", "title":"English"}, {"locale":"sl-SI", "title": "Slovenian"},  {"locale":"de-AT", "title": "German"},  {"locale":"fr-FR", "title":"French"}, {  "locale":"se-SE", "title":"Swedish" }]'
