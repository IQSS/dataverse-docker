## DataverseEU Docker module
Dataverse Docker module was developed by [DANS](http://dans.knaw.nl) (Data Archiving and Networked Services) to run Dataverse data repository on Kubernetes and other Cloud services supporting Docker.
Current available version of [Dataverse](https://github.com/IQSS/dataverse) is 5.0. The development of Docker module funded by [SSHOC](https://sshopencloud.eu/) project that will create the social sciences and humanities area of the European Open Science Cloud (EOSC).

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

### Installation

Dataverse Docker module v5.0 uses Træfik, a modern HTTP reverse proxy and load balancer that makes deploying microservices easy. Træfik integrates with your existing infrastructure components (Docker, Swarm mode, Kubernetes, Marathon, Consul, Etcd, Rancher, Amazon ECS, ...) and configures itself automatically and dynamically.

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

If it's not coming up please check if all required containers are up: `docker ps`

```

CONTAINER ID        IMAGE                                 COMMAND                  CREATED              STATUS              PORTS                                          NAMES

3a30792b22fe        dockereu_dataverse                    "/opt/dv/entrypoint.b"   About a minute ago   Up About a minute   0.0.0.0:440->443/tcp, 0.0.0.0:8085->8080/tcp   dataverse

8903ffab7d79        dockereu_solr                         "/entrypoint.sh solr"    About a minute ago   Up About a minute   0.0.0.0:8985->8983/tcp                         solr

e652e204e6bb        dockereu_postgres                     "docker-entrypoint.sh"   14 minutes ago       Up About a minute   0.0.0.0:5435->5432/tcp                         db
```

#### Going from Docker Compose to Kubernetes
If you want to run Dataverse on Kubernetes please use [this module](https://github.com/IQSS/dataverse-kubernetes)

#### Warning

If not all languages are coming up in the same time please increase RAM for Docker (not less than 10Gb for 5 languages). 

#### To Do

Health check support should be added to get Dataverse installation process from Docker more sustainable.

