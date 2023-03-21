# "Archive in a box" package for Dataverse
This infrastructure with integrated services intented for the research organizations and universities which want to run Community based Data Repository to make their data FAIR (Findable, Accessible, Interoperable and Reusable). The idea of having "Archive in a box" is simple: it should be doing an automatic installation and setting up the complete infrastructure without extra efforts and by institutions having limited technical resources. You can easily turn this demonstration service with default FAKE persistent identifiers into completely operational data archive with production DOIs, mail relay and automatically connected external storages. 

## Dataverse Docker module
Dataverse Docker module was developed by [DANS-KNAW](http://dans.knaw.nl) (Data Archiving and Networked Services, the Netherlands) to run [Dataverse](http://github.com/IQSS/dataverse) data repository on Kubernetes and other Cloud services supporting Docker.
Current available version of [Dataverse](https://github.com/IQSS/dataverse) in the Docker module is 5.13. The development of Docker module funded by [SSHOC](https://sshopencloud.eu/) project that will create the social sciences and humanities area of the European Open Science Cloud [EOSC](https://www.eosc.eu).

## Presentations
"Archive in a box" was presented at the Harvard Dataverse Community Meeting 2022 by Slava Tykhonov (DANS-KNAW), you can watch it on [YouTube](https://www.youtube.com/embed/-Re_elg67e8?start=128).

## Quick Demo 

You can run Dataverse in demo mode using default settings (FAKE DOIs, no mail relay, GUI in English, Cloud storage support disabled):
```
bash ./demostart.sh
``` 
It takes 2-5 minutes to start the complete infastructure (depends from your hardware configuration). You can find Dataverse running on http://localhost:8080.

## Basic Technologies
This software package relies on container technologies like Docker and Kubernetes, and can install and manage all dependencies without human interaction. “Archive in a box” uses Docker Compose, a tool for defining and running multi-container Docker applications and allows configuring application's services. All networking issues such as domain name setup, SSL certificates and routing are carried out by Traefik, leading modern reverse proxy and load balancer. 

### Demo version and development/production service
The demonstration version of Dataverse (“Proof of Concept”) is available out of the box after completing the installation on the local computer or Virtual Machine. It will be shipped with FAKE persistent identifiers, language switch and various content previewers, and other components integrated in the infrastructure. This default installation could be done by people without technical background and allows extensive testing of the basic functionality without spending any time on the system administration tasks related to the Dataverse setup. 

To run their Dataverse as a completely operational production service, data providers  should fill all settings in the [configuration file](https://github.com/IQSS/dataverse-docker/blob/master/.env) containing information about their domain name, DOIs settings, the language of web interface, mail relay, external controlled vocabularies and storage. There is also possibility to integrate Docker based custom services in the infrastructure and create own software packages serving the needs of the specific data providers, for example, to integrate a separate Shibboleth container for the federated authentication, install new data previewer or activate data processing pipeline.

### Configuration
The configuration is managed in the central place in an environmental variables file called [.env](https://github.com/IQSS/dataverse-docker/blob/master/.env), so administrators have no need to modify other files in the software package. It contains all necessary settings required to deploy Dataverse, for example, to set the language or web interface, establish connection to the local database, SOLR search engine, mail relay or external storage. 

### Startup process 
The startup process of “Archive in a box” is simplified and uses init.d folder defined in .env  to arrange the order how Dataverse configuration scripts will be running. It contains bash scripts making the services run sequentially and allows easy customization of Dataverse instances according to the requirements of the data providers. All necessary actions like setting up domain name and mail relay, activate previewers, webhook installation etc could be found in this init.d folder. After being restarted, all available datasets in Dataverse will be reindexed automatically.

### Custom metadata support
Custom metadata schemes could be easily integrated in Dataverse by using the same mechanism based on the init.d folder. New schema should be declared in .env file first and after script should be added to download the schema as a .tsv file and upload it in Dataverse. As a demonstration of this feature, CESSDA CMM and CLARIN metadata schemes are already integrated and available in the software package, and could be activated in the .env file and in the Dataverse web interface.

### External controlled vocabularies plugin
The functionality to support [external controlled vocabularies](https://github.com/gdcc/dataverse-external-vocab-support) was contributed by DANS-KNAW in the collaboration with Global Dataverse Consortium, and allows connecting Dataverse to vocabularies hosted by Skosmos, ORCID, Wikidata and other service providers. “Archive in a box” has a basic demonstration of this feature and encourages developers from all over the world to implement their own interfaces in order to integrate Dataverse with third party controlled vocabularies.

### External storages
Another important feature of “Archive in a box” is external storage support. It has integrated High Performance, Kubernetes Native Object Storage called MinIO and delivers scalable, secure, S3 compatible object storage to every public cloud like Amazon AWS, Google Cloud Platform or Microsoft Azure. It means Dataverse can store data in the Cloud storage instead of local file storage, and different storages could be used for the containers (subdataverses) of different data providers created within the same Dataverse instance.

### Webhooks for third parties services
There is a separate webhook implementation for the integration of external services based on Dataverse related actions like dataset modification or publication. For example, automatic FAIR assessment could be done by sending a newly created persistent identifier to the third party service when the user publishes a new dataset. There is also the possibility to integrate Dataverse with various pipelines and workflows dedicated for some specific tasks like named entity recognition in the uploaded files. It can be useful for building GDPR related workflows to get automatic checks if there are some person names present in the data.

### The list of main features
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
- built-in Web interface localization uses [Dataverse language pack](https://github.com/GlobalDataverseCommunityConsortium/dataverse-language-packs) to support multiple languages out of the box

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

# Dataverse distributions
You can use different Dataverse distributions, or distros, and add any Dockerized components depending from your use case. To switch to another distro you should change the variable COMPOSE_FILE in your .env file to the yaml file below.
For example, edit .env file, change this variable 
```
COMPOSE_FILE=./docker-compose.yml
```
and apply the specification to run another Dataverse distro with ssl support:
```
COMPOSE_FILE=./distros/docker-compose-ssl.yml
```

### Installation

Dataverse Docker module v5.10 uses Træfik, a modern HTTP reverse proxy and load balancer that makes deploying microservices easy. Træfik integrates with your existing infrastructure components (Docker, Swarm mode, Kubernetes, Marathon, Consul, Etcd, Rancher, Amazon ECS, ...) and configures itself automatically and dynamically.

You need to specify the value of "traefikhost" and pub your domain name there (for example, sshopencloud.eu or just localhost) before you'll start to deploy Dataverse infrastructure:

```export traefikhost=localhost``` OR ```export traefikhost=sshopencloud.eu```

and create docker network for all the containers you would expose on the web

```docker network create traefik```

By default you'll get SSL certificate provided by letsencrypt, please specify your email address if you need https support, for example:

```export useremail=team@mydataverse.org```

* Make sure you have docker and docker-compose installed
* Run `docker-compose up` to start Dataverse.

Standalone Dataverse should be running on dataverse-dev.localhost or dataverse-dev.sshopencloud.eu if you've selected the domain.

Default user/password: dataverseAdmin/admin and after you should change it.

Check if Dataverse is already available:
```curl http://localhost:8080```

If it's not coming up please check if all required containers are up: `docker ps`

```

CONTAINER ID        IMAGE                                 COMMAND                  CREATED              STATUS              PORTS                                          NAMES
fa727beadf8f   coronawhy/dataverse:5.10                    "/tini -- /bin/sh -c…"   About an hour ago   Up About an hour   0.0.0.0:4848->4848/tcp, :::4848->4848/tcp, 8181/tcp, 0.0.0.0:8009->8009/tcp, :::8009->8009/tcp, 9009/tcp, 0.0.0.0:8088->8080/tcp, :::8088->8080/tcp   dataverse
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

### Citation

For academic use please cite this work as:
``
Marion Wittenberg, Vyacheslav Tykhonov, Eko Indarto, Wilko Steinhoff, Laura Huis in 't Veld, Stefan Kasberger, Philipp Conzett, Cesare Concordia, Peter Kiraly, & Tomasz Parkoła. (2022). D5.5 'Archive in a Box' repository software and proof of concept of centralised installation in the cloud. Zenodo. https://doi.org/10.5281/zenodo.6676391
``
#### Warning

If not all languages are coming up in the same time please increase RAM for Docker (not less than 10Gb for 5 languages). 

### To Do
* Documentation on the external controlled vocabularies support
* Dataverse distributives for different projects
* Information about the process to set up SSHOC Kubernetes 
