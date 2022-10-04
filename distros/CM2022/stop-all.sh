#!/bin/bash

cd superset
docker-compose -f superset-docker-compose.yml down
cd ../did
docker-compose down
cd ../doccano
docker-compose -f docker/docker-compose.yml down
cd ../Skosmos
docker-compose -f dockerfiles/skosmos-docker-compose.yml down
cd ../weblate-docker
docker-compose -f weblate-docker-compose.yml down
