dataverse.no installation
=========================

Prerequisites :  have sudo rights
install Prerequisites, docker, docker-compose, and git

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
  apt-get install docker-ce docker-ce-cli containerd.io
  curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  apt-get install git
  
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

  git clone https://github.com/IQSS/dataverse-docker
  cd $DISTRIB/dataverse-docker/
  git branch dataverse.no
  cp $DISTRIB/dataverse-docker/secrets  $CONFIGURATION_PATH
  cp .env_sample .env
  docker network create traefik

The following variables need to be changed in .env

.. code-block:: bash

  hostname=dataverse.no
  traefikhost=dataverse.no

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
  
Certificates installation
-------------------------

Request the certificates from the correct authority

dataverse.pem order:
local in file $[hostmame].pem
Intermediate in file sectigo-intermediate.pem 
Root in file sectigo-intermediate.pem
TODO : split and cat command for automatisation



certificates should be put in ´´$CONFIGURATION_PATH/configuration/files´´ there are 2 files a .pem file and a .key file

The name of the certificates files should match the name in  ´´$CONFIGURATION_PATH/configuration/files/certificate.toml´´

Check the certificates with ´´curl -placeholder hostname ´´


DOCROOT
-------

The appropriate docroot folder needs to be copied in ``$DISTRIB/docroot``
for example ´´rsync -arzvP --rsh=ssh ./docroot [ServerName]:/distrib/docroot´´



Apache and shibboleth configuration 
----------------------------------- 
Apache configuration

Change domain name

Set up shibboleth 

Copy keyen.sh comand





Cronjob to automatically restart dataverse
------------------------------------------

NB:remeber to stop it if you want it stoped :)

``*/3 * * * * /bin/bash /root/restart-dataverse.sh https://test-docker.dataverse.no``


