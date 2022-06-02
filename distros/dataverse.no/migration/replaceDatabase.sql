UPDATE dvobject SET storageidentifier=REPLACE(storageidentifier,'file://','S3://') WHERE dtype='Dataset' and storageidentifier like '%file://%';

UPDATE dvobject SET storageidentifier=REPLACE(storageidentifier,'file://','S3://2002-green-dataversenotest1:') WHERE id IN (SELECT o.id FROM dvobject o, dataset s WHERE o.dtype = 'DataFile' AND s.id = o.owner_id AND s.harvestingclient_id IS null AND o.storageidentifier LIKE '%file://%');
UPDATE dvobject SET storageidentifier=REPLACE(storageidentifier,'local://','S3://2002-green-dataversenotest1:') WHERE id IN (SELECT o.id FROM dvobject o, dataset s WHERE o.dtype = 'DataFile' AND s.id = o.owner_id AND s.harvestingclient_id IS null AND o.storageidentifier LIKE '%file://%');




