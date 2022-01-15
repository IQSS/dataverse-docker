# "Archive in the box" distributive for Dataverse
This distributive is intented for the research organizations and universities which want to run Community based Data Repository to make their data FAIR (Findable, Accessible, Interoperable and Reusable). The idea of having "archive in the box" is simple: it should be doing an automatic installation and setting up the complete infrastructure without extra efforts and by institutions having limited technical resources. You can easily turn this demonstration service with default FAKE persistent identifiers into completely operational data archive with production DOIs, mail relay and automatically connected external storages. 

## Dataverse Docker module
Dataverse Docker module was developed by [DANS-KNAW](http://dans.knaw.nl) (Data Archiving and Networked Services, the Netherlands) to run [Dataverse](http://github.com/IQSS/dataverse) data repository on Kubernetes and other Cloud services supporting Docker.
Current available version of [Dataverse](https://github.com/IQSS/dataverse) in the Docker module is 5.8. The development of Docker module funded by [SSHOC](https://sshopencloud.eu/) project that will create the social sciences and humanities area of the European Open Science Cloud [EOSC](https://www.eosc.eu).

### Main features
- fully automatic Dataverse deployment with Traefik proxy
- Dataverse configuration managed through environmental file .env
- different Dataverse distributives with services on your preference suitable for different use cases
- external controlled vocabularies support (demo of CESSDA CMM metadata fields connected to Skosmos framework)
- MinIO storage support
- data previewers integrated in the distributive
- startup process managed through scripts located in init.d folder 
- automatic SOLR reindex 
- external services integration PostgreSQL triggers
- support of custom metadata schemes (CESSDA CMM, CLARIN CMDI, ...)

# Project Requirements
* Docker & Docker-compose

# Project Setup
1. Clone the project
```
git clone https://github.com/IQSS/dataverse-docker
```
2. Copy the environment file following the command in the project root directory
```
cp .env_sample .env
```
You can edit .env file and add your configuration for DOI service, mailrelay, S3 connections, etc.

# Dataverse distributives
You can use different Dataverse distributives depending from your use case. To switch to another distributive you should change the variable COMPOSE_FILE in your .env file to the yaml file below.
For example, edit .env file, change this variable 
```
COMPOSE_FILE=./docker-compose.yml
```
and apply the specification to run another Dataverse distributive with ssl support:
```
COMPOSE_FILE=./distributives/docker-compose-ssl.yml
```

### Installation

Dataverse Docker module v5.8 uses Træfik, a modern HTTP reverse proxy and load balancer that makes deploying microservices easy. Træfik integrates with your existing infrastructure components (Docker, Swarm mode, Kubernetes, Marathon, Consul, Etcd, Rancher, Amazon ECS, ...) and configures itself automatically and dynamically.

You need to specify the value of "traefikhost" and pub your domain name there (for example, sshopencloud.eu or just localhost) before you'll start to deploy Dataverse infrastructure:

```export traefikhost=localhost``` OR ```export traefikhost=sshopencloud.eu```

and create docker network for all the containers you would expose on the web

```docker network create traefik```

By default you'll get SSL certificate provided by letsencrypt, please specify your email address if you need https support, for example:

```export useremail=team@mydataverse.org```

* Make sure you have docker and docker-compose installed
* Run `docker-compose up` to start Dataverse on your domain name with SSL support
or 
* run `docker-compose -f docker-compose-local.yml up` to try Dataverse on localhost

Standalone Dataverse should be running on dataverse-dev.localhost or dataverse-dev.sshopencloud.eu if you've selected the domain.

Default user/password: dataverseAdmin/admin and after you should change it.

Check if Dataverse is already available:
```curl http://localhost:8080```

If it's not coming up please check if all required containers are up: `docker ps`

```

CONTAINER ID        IMAGE                                 COMMAND                  CREATED              STATUS              PORTS                                          NAMES
fa727beadf8f   coronawhy/dataverse:5.8                    "/tini -- /bin/sh -c…"   About an hour ago   Up About an hour   0.0.0.0:4848->4848/tcp, :::4848->4848/tcp, 8181/tcp, 0.0.0.0:8009->8009/tcp, :::8009->8009/tcp, 9009/tcp, 0.0.0.0:8088->8080/tcp, :::8088->8080/tcp   dataverse
d4b83af11948   coronawhy/solr:8.9.0                       "docker-entrypoint.s…"   About an hour ago   Up About an hour   0.0.0.0:8983->8983/tcp, :::8983->8983/tcp                                                                                                             solr
bf0478c288cd   containous/whoami                          "/whoami"                About an hour ago   Up About an hour   80/tcp                                                                                                                                                whoami
38d7151cb7cb   postgres:10.13                             "docker-entrypoint.s…"   About an hour ago   Up About an hour   0.0.0.0:5433->5432/tcp, :::5433->5432/tcp                                                                                                             postgres
ce83792a3abd   minio/minio:RELEASE.2021-12-10T23-03-39Z   "/usr/bin/docker-ent…"   About an hour ago   Up About an hour   9000/tcp, 0.0.0.0:9016-9017->9016-9017/tcp, :::9016-9017->9016-9017/tcp                                                                               minio
92c8fa3730a2   traefik:v2.2                               "/entrypoint.sh --ap…"   About an hour ago   Up About an hour   0.0.0.0:80->80/tcp, :::80->80/tcp, 0.0.0.0:443->443/tcp, :::443->443/tcp                                                                              traefik
```

#### Enjoy Dataverse
Open in your browser the selected domain name (like sshopencloud.eu) or just go to http://localhost:8080

#### Going from Docker Compose to Kubernetes
If you want to run Dataverse on Kubernetes please use [this module](https://github.com/IQSS/dataverse-kubernetes)

### Dataverse web interface localization
The localization of Dataverse was done in CESSDA DataverseEU and others projects. It's maintained by [Global Dataverse Community Consortium](https://github.com/GlobalDataverseCommunityConsortium/dataverse-language-packs) and available for the following languages:

- [English (US), latest develop branch](https://github.com/GlobalDataverseCommunityConsortium/dataverse-language-packs/tree/develop/en_US) maintained by [IQSS Harvard](https://github.com/IQSS/dataverse/tree/develop/src/main/java/propertyFiles)
- [French (Canada), latest available 4.19](https://github.com/GlobalDataverseCommunityConsortium/dataverse-language-packs/tree/dataverse-v4.19/fr_CA) maintained by [Bibliothèques Université de Montréal](https://bib.umontreal.ca/)
- [French (France), 4.9.4](https://github.com/IQSS/dataverse-docker/blob/master/dataversedock/dataverse-property-files/fr-FR/) maintained by [Sciences Po](https://www.sciencespo.fr/en/)
- [German (Austria), 4.9.4](https://github.com/IQSS/dataverse-docker/blob/master/dataversedock/dataverse-property-files/de-AT/) maintained by [AUSSDA](http://aussda.at)
- [Slovenian, 4.9.4](https://github.com/IQSS/dataverse-docker/blob/master/dataversedock/dataverse-property-files/sl-SI/) maintained by [ADP, Social Science Data Archive](https://www.adp.fdv.uni-lj.si/eng/)
- [Swedish, 4.9.4](https://github.com/IQSS/dataverse-docker/blob/master/dataversedock/dataverse-property-files/se-SE/) maintained by [SND, Swedish National Data Service](https://snd.gu.se/en)
- [Ukrainian, 4.9.4](https://github.com/IQSS/dataverse-docker/blob/master/dataversedock/dataverse-property-files/ua-UA/Bundle_ua.properties) maintained by [The Center for Content Analysis](http://ukrcontent.com/en/)
- [Spanish, 4.11](https://github.com/GlobalDataverseCommunityConsortium/dataverse-language-packs/tree/dataverse-v4.11/es_ES) maintained by [El Consorcio Madroño](http://consorciomadrono.es/en/)
- [Italian 4.9.4](https://github.com/IQSS/dataverse-docker/blob/master/dataversedock/dataverse-property-files/it-IT/) maintained by [Centro Interdipartimentale UniData](http://www.unidata.unimib.it)
- [Hungarian, 4.9.4](https://github.com/IQSS/dataverse-docker/tree/master/dataversedock/dataverse-property-files/hu-HU) maintained by [TARKI](http://tarki.hu)
- [Portuguese, 4.18.1](https://github.com/GlobalDataverseCommunityConsortium/dataverse-language-packs/tree/dataverse-v4.18.1/pt_PT) maintained by [University of Minho](https://www.uminho.pt/EN)
- [Portuguese, 4.19](https://github.com/RNP-dadosabertos/dataverse-language-packs) maintained by [Rede Nacional de Ensino e Pesquisa/Universidade Federal do Rio Grande do Sul](https://www.dadosdepesquisa.rnp.br/)

#### Warning

If not all languages are coming up in the same time please increase RAM for Docker (not less than 10Gb for 5 languages). 

