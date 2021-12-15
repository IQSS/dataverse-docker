#!/bin/bash
echo "Setting up the settings" >> /tmp/status.log
echo  "- Allow internal signup" >> /tmp/status.log
SERVER=http://${DATAVERSE_URL}/api
echo $SERVER
curl -X PUT -d yes "$SERVER/admin/settings/:AllowSignUp"
curl -X PUT -d /dataverseuser.xhtml?editMode=CREATE "$SERVER/admin/settings/:SignUpUrl"
curl -X PUT -d CV "$SERVER/admin/settings/:CV"
curl -X PUT -d burrito $SERVER/admin/settings/BuiltinUsers.KEY
curl -X PUT -d localhost-only $SERVER/admin/settings/:BlockedApiPolicy
curl -X PUT -d 'native/http' $SERVER/admin/settings/:UploadMethods
curl -X PUT -d solr:8983 "$SERVER/admin/settings/:SolrHostColonPort"
echo

# Demo server with FAKE DOIs if doi_authority is empty
if [ -z "${doi_authority}" ]; then
    curl -X PUT -d doi "$SERVER/admin/settings/:Protocol"
    curl -X PUT -d 10.5072 "$SERVER/admin/settings/:Authority"
    curl -X PUT -d "FK2/" "$SERVER/admin/settings/:Shoulder"
    curl -X PUT -d FAKE "$SERVER/admin/settings/:DoiProvider"
fi

