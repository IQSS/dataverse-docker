#!/bin/bash

#cp .env_sample .env
curl -L -o stw.ttl.zip http://zbw.eu/stw/version/latest/download/stw.ttl.zip
unzip -o stw.ttl.zip
curl -I -X POST -H Content-Type:text/turtle -T stw.ttl -G http://0.0.0.0:3030/skosmos/data --data-urlencode graph=http://zbw.eu/stw/
curl -L -o unescothes.ttl http://skos.um.es/unescothes/unescothes.ttl
curl -I -X POST -H Content-Type:text/turtle -T unescothes.ttl -G http://0.0.0.0:3030/skosmos/data --data-urlencode graph=http://skos.um.es/unescothes/

# wget from github and store CBS vocabulary in ./config/cbs-variables-thesaurus.ttl
curl -I -X POST -H Content-Type:text/turtle -T ./config/cbs-variables-thesaurus.ttl -G http://0.0.0.0:3030/skosmos/data --data-urlencode graph=http://cbs.nl/variables/

echo "Checking search index..."
curl "http://0.0.0.0:8000/rest/v1/search?vocab=stw&query=a*"
