#!/bin/bash

curl -X PUT -d 'true' http://localhost:8080/api/admin/settings/:FilePIDsEnabled

curl -s https://github.com/IQSS/dataverse/releases/download/v5.14/citation.tsv -o /tmp/citation.tsv
curl http://localhost:8080/api/admin/datasetfield/load -X POST --data-binary @/tmp/citation.tsv -H "Content-type: text/tab-separated-values"

rm /tmp/citation.tsv