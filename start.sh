#!/bin/bash
docker-compose up -d
sleep 60
docker exec dataverse asadmin --user=admin --passwordfile=/opt/payara/passwordFile deploy /opt/payara/deployments/dataverse.war

