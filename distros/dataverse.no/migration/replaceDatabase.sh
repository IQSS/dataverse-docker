#!/bin/bash

docker cp ./replaceDatabase.sql postgres:/tmp

docker exec -it  postgres  bash -c  "su - postgres;psql -U dataverse dataverse -f /tmp/replaceDatabase.sql"

