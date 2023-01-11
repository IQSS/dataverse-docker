Create dump of production database
----------------------------------

connect using ssh to production VM

if you are using a dockerized version  : ``docker exec -it postgres /bin/sh``

.. code-block:: bash

  su postgres
  pg_dump -U dataverse dataverse > /tmp/dataverse.dump;

Transmit dump file to appropriate vm using rsync ``rsync -arvzP --rsh=ssh <Source>:/tmp/dataverse.dump <destination>:/tmp/dataverse.dump ``

Upload dump of production database
----------------------------------

Connect using ssh to new VM


.. code-block:: bash

  docker cp /tmp/dataverse.dump postgres:/tmp/
  docker stop dataverse


If you are using a dockerized version  : ``docker exec -it postgres /bin/sh``

.. code-block:: bash

  su postgres
  dropdb -U dataverse dataverse;
  createdb -U dataverse dataverse;
  psql -U dataverse dataverse -f /tmp/dataverse.dump
  
 Change password
 
  
  
Usefull database alteration
===========================
  
Replace production DOI with test DOI
------------------------------------
  
if you are using a dockerized version  : ``docker exec -it postgres /bin/sh``

.. code-block:: bash

  su postgres
  psql -U dataverse dataverse
  update dvobject set authority='10.21337' where authority like '%10.18710%';

Change dataverse admin password
-------------------------------

if you are using a dockerized version  : ``docker exec -it postgres /bin/sh``

.. code-block:: bash

  Su postgres
  psql -U dataverse dataverse
  update builtinuser set encryptedpassword= '<pawwordHash>' where username like '%dataverseAdmin%';


Change the database passord
---------------------------
 
if you are using a dockerized version  : ``docker exec -it postgres /bin/sh``
this needs to be consistent with the passord in ``secrets/db/password`` and in ``.env``

.. code-block:: bash

  su postgres
  ALTER USER DATAVERSE WITH PASSWORD '<password>';



Change feide login endpoint
---------------------------

if you are using a dockerized version  : ``docker exec -it postgres /bin/sh``

.. code-block:: bash

  su postgres
  psql -U dataverse dataverse
  sql update authenticateduserlookup set persistentuserid=regexp_replace(persistentuserid, 'idp\.', 'idp-test.');

Setting up an S3 bucket
-----------------------

Create an S3 bucket using your prefered provider

The asadmin commands descried in https://guides.dataverse.org/en/latest/installation/config.html#amazon-s3-storage-or-compatible and be found in `distros/dataverse.no/init.d/006-s3-aws-storage.sh <https://github.com/DataverseNO/dataverse-docker/blob/dataverse.no/distros/dataverse.no/init.d/006-s3-aws-storage.sh>`_ Create one file for every new bucket.

in .env(add link) change the folowing

.. code-block:: bash

  aws_uit_bucket_name=<bucket name>
  aws_uit_s3_profile=<profile name>
  aws_endpoint_url= <endpoint URL>

The <endpoint URL> can be for exemple ``https\:\/\/s3-oslo.educloud.no`` , specials caracters need to be escaped. If ussing an aws provided bucket the endpoint is not nessesary and the region should be set instead in `secrets/aws-cli/.aws/config`_

The region and format should be set in `secrets/aws-cli/.aws/config`_ if using a custom endpoint <region> should be set to a non existant region.

.. _secrets/aws-cli/.aws/config: https://github.com/DataverseNO/dataverse-docker/blob/dataverse.no/secrets/aws-cli/.aws/config/
.. code-block:: bash
  [<profile name>]
  output = json
  region = <region>

The credentials should be set in `secrets/aws-cli/.aws/credentials <https://github.com/DataverseNO/dataverse-docker/blob/dataverse.no/secrets/aws-cli/.aws/credentials>`_

.. code-block:: bash

  [<profile name>]
  aws_access_key_id=<bucketId>
  aws_secret_access_key=<bucketkey>

Copy files to and from S3 storage
-----------------------------------


Change File storage location
----------------------------


File stored in S3 : S3://10.21337/WFD8O0 

File stored in local 
``select * from dvobject where identifier like '%XCCW4L%';`` : file://10.21337/XCCW4L

the following update statement is to update the files while not affecting the external datasets harvested form other locations listed in table 'dataset'.

.. code-block:: sql

  UPDATE dvobject SET storageidentifier=REPLACE(storageidentifier,'file://','<storage identifier>://<bucket name>:') WHERE id IN (SELECT o.id FROM dvobject o, dataset s WHERE o.dtype = 'DataFile' AND s.id = o.owner_id AND s.harvestingclient_id IS null AND o.storageidentifier LIKE '%file://%');

the following update statement is to update the datasets while not affecting the external datasets harvested form other locations listed in table 'dataset'.

.. code-block:: sql
  
   UPDATE dvobject SET storageidentifier=REPLACE(storageidentifier,'file://','<storage identifier>://') WHERE id IN (SELECT o.id FROM dvobject o, dataset s WHERE o.dtype = 'Dataset' AND s.id = o.id AND s.harvestingclient_id IS null AND o.storageidentifier LIKE '%file://%');

in the following exemple  <storage identifier> = S3 and <bucket name> = 2002-green-dataversenotest1

.. code-block:: sql

  UPDATE dvobject SET storageidentifier=REPLACE(storageidentifier,'file://','S3://2002-green-dataversenotest1:') WHERE id IN (SELECT o.id FROM dvobject o,   dataset s WHERE and o.dtype = 'DataFile' AND s.harvestingclient_id IS null AND o.storageidentifier LIKE '%file://%');
  UPDATE dvobject SET storageidentifier=REPLACE(storageidentifier,'file://','S3://') WHERE id IN (SELECT o.id FROM dvobject o, dataset s WHERE o.dtype = 'Dataset' AND s.id = o.id AND s.harvestingclient_id IS null AND o.storageidentifier LIKE '%file://%');

exemple to update for a specifics owner:

.. code-block:: sql

  UPDATE dvobject SET storageidentifier=REPLACE(storageidentifier,'file://','S3://2002-green-dataversenotest1:') WHERE id IN (SELECT o.id FROM dvobject o,   dataset s WHERE o.owner_id=107543 and o.dtype = 'DataFile' AND s.id = o.owner_id AND s.harvestingclient_id IS null AND o.storageidentifier LIKE '%file://%');

Get MDF5 for the files uploaded today
-------------------------------------

.. code-block:: sql

  select * from dvobject as dv, datafile as df where dv.dtype='DataFile' and modificationtime>='2022-09-20' and dv.id=df.id order by df.id desc limit 10;


the mdf is corespmding to the etag in cloudian


Get MDF5 for the files uploaded today
-------------------------------------

Delete action logs older then 90 days

.. code-block:: sql

  DELETE FROM actionlogrecord WHERE starttime < current_timestamp - interval '90 days';


