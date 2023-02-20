Dataverse installation on Microsoft Azure
=========================================

Installation of docker, docker-compose, git and, azure-cli
----------------------------------------------------------

Update APT sources
------------------

This needs to be done so as to access packages from Docker repository.

1. Log into your VM machine as a user with sudo or root privileges.

2. Open a terminal window.

3. Update package information, ensure that APT works with the https method, and that CA certificates are installed.

.. code-block:: bash

  sudo su
  apt-get update
  apt-get install -y \
      ca-certificates \
      curl \
      azure-cli \
      gnupg \
      lsb-release
      
4. Add Docker’s official GPG key:

.. code-block:: bash

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

Verify that the key fingerprint is for example 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88

.. code-block:: bash

sudo apt-key fingerprint 0EBFCD88

5. Fnd the entry in the table below which corresponds to your Ubuntu version. This determines
where APT will search for Docker packages.

Run the following command, substituting the entry for your operating system for the placeholder <REPO>.

.. code-block:: bash

  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

6. Update the APT package index by executing sudo apt-get update.

.. code-block:: bash

  apt-get update
  
 7. Verify that APT is pulling from the right repository. The version currently installed is marked with ***.
 
.. code-block:: bash
  
  apt-cache policy docker-engine

 8. Install Docker Community Edition and git
 
.. code-block:: bash
 
  apt-get install -y docker-ce docker-ce-cli containerd.io
  curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  apt-get install -y git azure-cli
  
Dataverse root folder
---------------------

Create a folder for secrets and define it in ``CONFIGURATION_PATH`` and ``DOCROOT`` default : ``/distrib/``

.. code-block:: bash
  
  export DISTRIB=/distrib
  export CONFIGURATION_PATH=$DISTRIB/private
  mkdir $DISTRIB
  mkdir $CONFIGURATION_PATH
  cd $DISTRIB




Clone the git
-------------

It is assumed here that you have already created a project and a git repository. See [GitHub](https://docs.github.com) on how to create a new project/repo or repo from an existing project.

.. code-block:: bash

  git clone https://github.com/DataverseNO/dataverse-docker.git
  cd $DISTRIB/dataverse-docker/
  git checkout dataverse.no
  cp -r $DISTRIB/dataverse-docker/secrets  $CONFIGURATION_PATH
  cp .env_sample .env
  az login --identity
  az acr login --name presacrd4oilmd5ss77y
  docker network create traefik

Environment variables
---------------------
If you are using docker-compose, you can skip setting the environment variables manually, as they will be set in the docker-compose.yml file or a .env file.

We have a pre-configured environment variables (.env) stored at our resource archive

.. code-block:: bash

  cd /$DISTRIB
  tar -xvzf /tmp/resourses.tar.gz
  cp $DISTRIB/private/.env $DISTRIB/dataverse-docker/

go to "Check that your dataverse instalation is accessible"

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

Check the certificates with ``curl --insecure -vvI https://0.0.0.0:443 2>&1 | awk 'BEGIN { cert=0 } /^\* SSL connection/ { cert=1 } /^\*/ { if (cert) print }'``


DOCROOT
-------

The appropriate docroot folder needs to be copied in ``$DISTRIB/docroot``
for example ``rsync -arzvP --rsh=ssh ./docroot [ServerName]:/distrib/docroot``



Apache and shibboleth configuration 
----------------------------------- 
Apache configuration

Change domainname in shibboleth ``shibboleth/shibboleth2.xml``

Change domainname twice in shibboleth ``distros/dataverse.no/configs/http-ssl.conf``

Change domainname twice in shibboleth ``./distros/dataverse.no/configs/domain.xml``

Copy keyen.sh comand

Check that your dataverse installation is accessible
----------------------------------------------------
.. code-block:: bash

  cd $DISTRIB/dataverse-docker/
  docker-compose up -d

Cronjob to automatically restart dataverse
------------------------------------------

NB:remeber to stop it if you want it stoped :)

``*/3 * * * * /bin/bash /root/restart-dataverse.sh https://test-docker.dataverse.no``


