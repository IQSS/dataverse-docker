Dataverse installation on Microsoft Azure
=========================================

Prerequisites :  have sudo rights
install Prerequisites, docker, docker-compose, and git, azure-cli

.. code-block:: bash

  sudo su
  apt-get update
  apt-get install \
      ca-certificates \
      curl \
      gnupg \
      lsb-release
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  apt-get update
  apt-get install -y docker-ce docker-ce-cli containerd.io
  curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  apt-get install -y git azure-cli
  
Dataverse root folder
---------------------

defined in ``CONFIGURATION_PATH`` and ``DOCROOT`` default : ``/distrib/``

.. code-block:: bash
  
  export DISTRIB=/distrib
  export CONFIGURATION_PATH=$DISTRIB/private
  mkdir $DISTRIB
  mkdir $CONFIGURATION_PATH
  cd $DISTRIB




Clone the git
-------------

.. code-block:: bash

  git clone https://github.com/DataverseNO/dataverse-docker.git
  cd $DISTRIB/dataverse-docker/
  git checkout dataverse.no
  cp -r $DISTRIB/dataverse-docker/secrets  $CONFIGURATION_PATH
  cp .env_sample .env
  az login --identity
  az acr login --name presacrd4oilmd5ss77y
  docker network create traefik

if using pre-made resourses archive
.. code-block:: bash
  tar -xvf resourse.tar $DISTRIB/
  cp $DISTRIB/private/secrets/.env $DISTRIB/dataverse-docker/.env

skip to cronjob instalation step

The following variables need to be changed in .env

.. code-block:: bash

  hostname=dataverse.azure.com
  traefikhost=dataverse.azure.om

main configuration

.. code-block:: bash

  DISTRIB=/distrib
  CONFIGURATION_PATH=/distrib/private

Solr

.. code-block:: bash

  LOCAL_STORAGE=/mntblob

Counter Processor

.. code-block:: bash

  GEOIPLICENSE=licencekey
  
Postgres settings

.. code-block:: bash

  POSTGRES_PASSWORD=password

  
DOI parameters

.. code-block:: bash

  doi_authority=10.21337
  doi_username=username
  doi_password=password
  
AWS

.. code-block:: bash

  
  
Certificates installation
-------------------------

Request the certificates from the correct authority

dataverse.no.pem order:

local, in file $[hostname].pem

Intermediate, in file sectigo-intermediate.pem 

Root, in file sectigo-intermediate.pem

To make the certificate pem file  ``cat sectigo-ecc-intermediate.pem >> *dataverse.no.pem``



certificates should be put in ``$CONFIGURATION_PATH/configuration/files`` there are 2 files a .pem file and a .key file

The name of the certificates files should match the name in  ``$CONFIGURATION_PATH/configuration/files/certificates.toml``

Check the certificates with ``curl -placeholder hostname``


DOCROOT
-------

The appropriate docroot folder needs to be copied in ``$DISTRIB/docroot``
for example ``rsync -arzvP --rsh=ssh ./docroot [ServerName]:/distrib/docroot``



Apache and shibboleth configuration 
----------------------------------- 
Apache configuration

Change domain name

Set up shibboleth 

Copy keyen.sh comand

Check that your dataverse instalation is axessible
--------------------------------------------------
.. code-block:: bash
cd $DISTRIB/dataverse-docker/
docker-compose up -d

Cronjob to automatically restart dataverse
------------------------------------------

NB:remeber to stop it if you want it stoped :)

``*/3 * * * * /bin/bash /root/restart-dataverse.sh https://test-docker.dataverse.no``


