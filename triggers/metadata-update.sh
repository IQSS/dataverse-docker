#!/bin/bash

for schemafile in $1/*.tsv; do
        curl http://localhost:8080/api/admin/datasetfield/load -H "Content-type: text/tab-separated-values" -X POST --upload-file $schemafile
done

cd /tmp
wget https://github.com/IQSS/dataverse/releases/download/v5.8/schema.xml
wget https://dataverse.scholarsportal.info/guides/en/latest/_downloads/4dc30a4612e714fd63732a21e8e7b030/update-fields.sh
curl "http://localhost:8080/api/admin/index/solr/schema" | bash ./update-fields.sh ./schema.xml
cp /tmp/schema.xml /opt/payara/dvinstall/schema.xml
curl "http://solr:8983/solr/admin/cores?action=RELOAD&core=collection1"
