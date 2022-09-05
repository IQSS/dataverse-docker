Default admin login
-------------------

username : dataverseAdmin

password : admin


S3 storage
----------

For testing purpuses S3 storage fuctionality can be disabled using :

``mv /distrib/dataverse-docker/distros/dataverse.no/init.d/0*s3*.sh /tmp/`` 

then restart dataverse

mail relay
----------

in ``.env``
~~~~~~~~~~~

Set ``system_email=<admin@localhost>``

for example ``system_email=000xxx@uit.no``


set the smtp relay 

.. code-block:: bash

  mailhost=smtp-relay.exemple.com
  mailuser=no-reply@dataverse.no
  no_reply_email=no-reply@dataverse.no
  smtp_password=password
  smtp_port=465
  socket_port=465

in the web interface
~~~~~~~~~~~~~~~~~~~~
Change the administrator email at https://<hotsname>/dataverseuser.xhtml?selectTab=accountInfo
the "Verify email" button should send en email.


doi settings
------------

feide authentication
--------------------

local storage
-------------

S3 support
----------

if S3 storage was disabled re unable it using :


``mv  /tmp/0*s3*.sh /distrib/dataverse-docker/distros/dataverse.no/init.d/`` 

large files
-----------


counter processor
-----------------

custom settings
--------------
