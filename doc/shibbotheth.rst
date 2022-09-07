Shibboleth
==========

Asuming a working shibboleth configuration in ``/tmp/shibboleth.tar.gz``
 
Copy and extract the files to the proper location

.. code-block:: bash

 export DISTRIB=/distrib
 cp /tmp/shibboleth* $DISTRIB/private
 cd $DISTRIB/private
 tar -xvf shibboleth.tar.gz
 cd $DISTRIB/private/shibboleth

Change domain name  ``entityID`` in ``shibboleth2.xml`` to the domain name of the instalation

Change SMAL service provider location 

you are done (mostely)
