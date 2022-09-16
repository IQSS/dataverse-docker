Create dump of production database
----------------------------------

connect using ssh to production VM

if you are using a dockerized version  : ``docker exec -it postgress /bin/sh``

.. code-block:: bash

  Su postgress
  pg_dump -U dataverse dataverse > /tmp/dataverse.dump;

Transmit dump file to appropriate vm using rsync ``rsync -arvzP --rsh=ssh <Source>:/tmp/dataverse.dump <destination>:/tmp/dataverse.dump ``

Upload dump of production database
----------------------------------

Connect using ssh to new VM


.. code-block:: bash

  docker cp /tmp/dataverse.dump postgres:/tmp/
  docker stop dataverse


If you are using a dockerized version  : ``docker exec -it postgress /bin/sh``

.. code-block:: bash

  su postgress
  dropdb -U dataverse dataverse;
  createdb -U dataverse dataverse;
  psql -U dataverse dataverse -f /tmp/dataverse.dump
  
  
Usefull database alteration
===========================
  
Replace production DOI with test DOI
------------------------------------
  
if you are using a dockerized version  : ``docker exec -it postgress /bin/sh``

.. code-block:: bash

  Su postgress
  psql -U dataverse dataverse
  update dvobject set authority='10.21337' where authority like '%10.18710%';

Change dataverse admin password
-------------------------------

if you are using a dockerized version  : ``docker exec -it postgress /bin/sh``

.. code-block:: bash

  Su postgress
  psql -U dataverse dataverse
  update builtinuser set encryptedpassword= '<pawwordHash>' where username like '%dataverseAdmin%';


Change the database passord
---------------------------
 
if you are using a dockerized version  : ``docker exec -it postgress /bin/sh``
this needs to be consistent with the passord in ``secrets/db/password`` and in ``.env``

.. code-block:: bash

  Su postgress
  ALTER USER DATAVERSE WITH PASSWORD '<password>';



Change feide login endpoint
---------------------------

if you are using a dockerized version  : ``docker exec -it postgress /bin/sh``

.. code-block:: bash

  Su postgress
  psql -U dataverse dataverse
  sql update authenticateduserlookup set persistentuserid=regexp_replace(persistentuserid, 'idp\.', 'idp-test.');


Change File storage location
----------------------------

NOT READY YET

update dvobject set storageidentifier='S3://2002-green-dataversenotest1:' where dtype='Dataset';

UPDATE dvobject SET storageidentifier=REPLACE(storageidentifier,'file://','S3://2002-green-dataversenotest1:') WHERE id IN (SELECT o.id FROM dvobject o, dataset s WHERE o.owner_id=107543 and o.dtype = 'DataFile' AND s.id = o.owner_id AND s.harvestingclient_id IS null AND o.storageidentifier LIKE '%file://%');










