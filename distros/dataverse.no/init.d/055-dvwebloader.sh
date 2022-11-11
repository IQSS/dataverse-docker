#!/bin/bash

export PGPASSWORD=`cat /secrets/db/password`
psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/webloader_check.sql -o /tmp/output
EXIST=`grep Dataverse /tmp/output`

wget https://github.com/DataverseNO/dvwebloader/archive/refs/heads/main.zip -O /tmp/dvwebloader.zip
unzip -o /tmp/dvwebloader.zip -d $DOCROOT_DIR/logos

if [[ -z $EXIST ]]; then
echo "Loaded"
curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
"{
  \"displayName\": \"Dataverse WebLoader\",
  \"description\": \"Upload all  the files in a local directory!\",
  \"toolName\": \"dvwebloader\",
  \"scope\": \"dataset\",
  \"contentType\":\"text/plain\",
  \"types\": [
    \"explore\"
  ],
  \"toolUrl\": \"https://${hostname}/logos/dvwebloader-main/src/dvwebloader.html\",
  \"toolParameters\": {
    \"queryParameters\": [
      {
        \"siteUrl\": \"{siteUrl}\"
      },
      {
        \"datasetPid\": \"{datasetPid}\"
      },
      {
        \"key\": \"{apiToken}\"
      }
    ]
  }
}"
fi
