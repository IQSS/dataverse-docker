dropdb -U dataverse dataverse;
createdb -U dataverse dataverse;
psql -U dataverse dataverse -f /mnttmp/opendata*.sql
