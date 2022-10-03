#!/bin/bash

git clone https://github.com/apache/superset
cp superset-docker-compose.yml ./superset/
cd superset
docker-compose -f superset-docker-compose.yml up -d 
cd ../did
docker-compose up -d
cd ..
