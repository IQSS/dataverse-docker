#!/bin/bash

git clone https://github.com/apache/superset
cp superset-docker-compose.yml ./superset/
cd superset
docker-compose -f superset-docker-compose.yml up -d 
cd ../did
docker-compose up -d
cd ..
git clone https://github.com/doccano/doccano
cp doccano-docker-compose.yml ./doccano/docker/docker-compose.yml
cd doccano
docker/.env.example ./.env
docker-compose -f docker/docker-compose.yml up -d
cd ..
git clone https://github.com/NatLibFi/Skosmos
cp skosmos-docker-compose.yml ./Skosmos/dockerfiles/
cd Skosmos
docker-compose -f dockerfiles/skosmos-docker-compose.yml up -d
cd ..
git clone https://github.com/WeblateOrg/docker-compose.git weblate-docker
cp weblate-docker-compose.yml ./weblate-docker/
cd weblate-docker
docker-compose -f weblate-docker-compose.yml up -d
