Shibboleth
==========

Asuming a working shibboleth configuration in ``/tmp/shibboleth.tar.gz``
 
Copy and extract the files to the proper location

.. code-block:: bash

  mv /tmp/shibboleth /$DISTRIB/private
  cd /$DISTRIB/private
  tar -xvf shibboleth.tar.gz .

Change hostname  ``entityID`` in ``shibboleth2.xm``
Change SMAL service provider location
you are done (mostely)
