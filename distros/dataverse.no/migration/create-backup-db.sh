#|/bin/bash
docker exec -it  postgres  bash -c  "pg_dump -U dataverse dataverse > /var/lib/postgresql/data/dataverse.dump"
gzip -c /extdisk/database-data-demo/dataverse.dump > "/extdisk/database-data-demo/dataverse$(date +'%Y%m%d').dump.gz"
docker exec -it  postgres  bash -c  "createdb -U dataverse dataverse-tmp"
docker exec -it  postgres  bash -c  "psql -U dataverse dataverse-tmp -f /var/lib/postgresql/data/dataverse.dump"
cp ./cleanup-database.sql /var/lib/postgresql/data/
docker exec -it  postgres  bash -c  "psql -U dataverse dataverse-tmp -f /var/lib/postgresql/data/cleanup-database.sql"
