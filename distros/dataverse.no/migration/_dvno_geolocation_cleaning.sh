#!/bin/bash
export PGPASSWORD=`cat /secrets/db/password`
psql -U dataverse dataverse -h postgres  -f ./_dvno_geolocation_cleaning20240301.sql
