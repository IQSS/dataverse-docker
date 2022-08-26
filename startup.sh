#!/bin/bash
docker-compose up -d
sleep 10
docker exec dataverse /etc/init.d/cron restart

