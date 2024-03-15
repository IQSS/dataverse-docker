#!/bin/bash

echo "Enable File PID:"
curl -X PUT -d 'true' http://localhost:8080/api/admin/settings/:FilePIDsEnabled
echo "PID finish"

echo "Downlaod and load citation.tsv file"
curl -s https://github.com/IQSS/dataverse/releases/download/v5.14/citation.tsv -o /tmp/citation.tsv
curl http://localhost:8080/api/admin/datasetfield/load -X POST --data-binary @/tmp/citation.tsv -H "Content-type: text/tab-separated-values"
echo "citation.tsv finish"

rm /tmp/citation.tsv