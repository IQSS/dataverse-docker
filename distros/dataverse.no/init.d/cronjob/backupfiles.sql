--select storageidentifier from dvobject where modificationtime>='2022-12-05';


--select storageidentifier, CONCAT(authority, '/',split_part(identifier, '/', 1) , '/', REPLACE(storageidentifier, 'S3://2002-green-dataversenotest1:','')), id from dvobject where storageidentifier like '%S3:%' and dtype='DataFile' and modificationtime>=(current_date - INTERVAL '1 day');


select storageidentifier, CONCAT( get_authority(id), '/', get_identifier(id), '/', REPLACE(storageidentifier, 'S3://2002-green-dataversenotest1:','')) from dvobject where storageidentifier like '%S3:%' and dtype='DataFile' and modificationtime>=(current_date - INTERVAL '7 day');



--select split_part(identifier, '/', 1) from dvobject where storageidentifier like '%S3:%' and identifier like '%/%' limit 10;
--select storageidentifier, CONCAT(authority, '/', identifier, '/', REPLACE(storageidentifier, 'S3://2002-green-dataversenotest1:','')), id from dvobject where storageidentifier like '%S3:%' limit 10;
