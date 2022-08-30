dataverse.no installation
=========================

Prerequisites :  have sudo rights
instal Prerequisites, docker, docker-compose, and git

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
  mkdir /distrib
  cd /distrib


Clone the git

.. code-block:: bash

  git clone https://github.com/IQSS/dataverse-docker
  cd /distrib/dataverse-docker/
  git branche dataverse.no
  docker network create traefik
  cp .env_sample .env

the folowings needs to be changed in .env

.. code-block:: bash

  hostname=demo.dataverse.no
  traefikhost=demo.dataverse.n



Conjob to automaticaly restart dataverse
----------------------------------------

``*/3 * * * * /bin/bash /root/restart-dataverse.sh https://test-docker.dataverse.no``
