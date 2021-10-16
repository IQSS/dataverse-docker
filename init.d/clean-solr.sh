echo "deleting all data from Solr"  >> /tmp/status.log;
curl http://solr:8983/solr/collection1/update/json?commit=true -H "Content-type: application/json" -X POST -d "{\"delete\": { \"query\":\"*:*\"}}" >> /tmp/status.log;
