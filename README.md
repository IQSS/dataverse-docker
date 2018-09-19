## DataverseEU Docker module
Dataverse Docker module was developed by [DANS](http://dans.knaw.nl) (Data Archiving and Networked Services) to run Dataverse data repository on Kubernetes and other Cloud services supporting Docker.

Special thanks to [@craig-willis](https://github.com/craig-willis) as development of this module wasn't possible without his ideas and contribution.

### Dataverse web interface localization 
Localization of Dataverse was done in CESSDA DataverseEU project. At the moment web interface is available for the following languages (tested for Dataverse 4.9.2):

- [French](https://github.com/IQSS/dataverse-docker/blob/master/dataversedock/lang.properties/Bundle_fr.properties) maintained by [Sciences Po](https://www.sciencespo.fr/en/)
- [German](https://github.com/IQSS/dataverse-docker/blob/master/dataversedock/lang.properties/Bundle_de.properties) maintained by [AUSSDA](http://aussda.at)
- [Slovenian](https://github.com/IQSS/dataverse-docker/blob/master/dataversedock/lang.properties/Bundle_sl.properties) maintained by [ADP, Social Science Data Archive](https://www.adp.fdv.uni-lj.si/eng/)
- [Swedish](https://github.com/IQSS/dataverse-docker/blob/master/dataversedock/lang.properties/Bundle_se.properties) maintained by [SND, Swedish National Data Service](https://snd.gu.se/en)
- [Ukrainian](https://github.com/IQSS/dataverse-docker/blob/master/dataversedock/lang.properties/Bundle_ua.properties) maintained by [The Center for Content Analysis](http://ukrcontent.com/en/)
- [Spanish](https://github.com/IQSS/dataverse-docker/blob/master/dataversedock/lang.properties/Bundle_es.properties) maintained by [El Consorcio Madroño](http://consorciomadrono.es/en/) 
- [Italian](https://github.com/IQSS/dataverse-docker/blob/04a5515423d7aff181e8d0417f8138646cb883b5/dataversedock/lang.properties/Bundle_it.properties) maintained by [Centro Interdipartimentale UniData](http://www.unidata.unimib.it)

New languages are coming soon:

- Hungarian

To switch language of web interface you need to stop glassfish, copy translated properties file to Bundle.properties file and start glassfish again. For example, for French web interface:
```
/opt/glassfish4/glassfish/bin/asadmin stop-domain
cp Bundle_fr.properties /opt/glassfish4/glassfish/domains/domain1/applications/dataverse/WEB-INF/classes/Bundle.properties
/opt/glassfish4/glassfish/bin/asadmin start-domain
```

### Installation

##### Prerequisites
First step is download of required software for authomatic Dataverse installation (PostgreSQL, SOLR, Glassfish, Dataverse)

`./initial.bash`

Please note, if you need to change version of Dataverse, it's in dataversedock/step2.sh (version="4.8.6")

##### Using Docker
* Make sure you have docker and docker-compose installed
* Build all containers with Docker Compose `docker-compose build` 
* Run `docker-compose up` so start Dataverse

Standalone Dataverse in English should be running on http://localhost:8085

Default user/password: dataverseAdmin/admin and after you should change it.

If it's not coming up please check if all required containers are up: `docker ps`

```

CONTAINER ID        IMAGE                                 COMMAND                  CREATED              STATUS              PORTS                                          NAMES

3a30792b22fe        dockereu_dataverse                    "/opt/dv/entrypoint.b"   About a minute ago   Up About a minute   0.0.0.0:440->443/tcp, 0.0.0.0:8085->8080/tcp   dataverse

8903ffab7d79        dockereu_solr                         "/entrypoint.sh solr"    About a minute ago   Up About a minute   0.0.0.0:8985->8983/tcp                         solr

e652e204e6bb        dockereu_postgres                     "docker-entrypoint.sh"   14 minutes ago       Up About a minute   0.0.0.0:5435->5432/tcp                         db
```

#### Multilingual support
If you want to start multilingual web interface please run

`docker-compose -f ./docker-multilingual.yml up`

After 20-25 minutes or so you’ll get localized Dataverses running on localhost:8085, localhost:8086 etc (see specification in .yaml file)

Check again if Dataverse containers are running by `docker ps`

```
CONTAINER ID        IMAGE                                 COMMAND                  CREATED              STATUS              PORTS                                          NAMES

cc84feb9760c        dockereu_dataverse_fr                 "/opt/dv/entrypoint.b"   About a minute ago   Up About a minute   0.0.0.0:446->443/tcp, 0.0.0.0:8088->8080/tcp   dataverse_fr

56229df080d9        dockereu_dataverse_es                 "/opt/dv/entrypoint.b"   About a minute ago   Up About a minute   0.0.0.0:450->443/tcp, 0.0.0.0:8090->8080/tcp   dataverse_es

14d7719ea79e        dockereu_dataverse_de                 "/opt/dv/entrypoint.b"   About a minute ago   Up About a minute   0.0.0.0:447->443/tcp, 0.0.0.0:8086->8080/tcp   dataverse_de

4af3942245ee        dockereu_dataverse_ua                 "/opt/dv/entrypoint.b"   About a minute ago   Up About a minute   0.0.0.0:453->443/tcp, 0.0.0.0:8089->8080/tcp   dataverse_ua

3a30792b22fe        dockereu_dataverse                    "/opt/dv/entrypoint.b"   About a minute ago   Up About a minute   0.0.0.0:440->443/tcp, 0.0.0.0:8085->8080/tcp   dataverse

8903ffab7d79        dockereu_solr                         "/entrypoint.sh solr"    About a minute ago   Up About a minute   0.0.0.0:8985->8983/tcp                         solr

e652e204e6bb        dockereu_postgres                     "docker-entrypoint.sh"   14 minutes ago       Up About a minute   0.0.0.0:5435->5432/tcp                         db
```

##### Specific language selection
If you want to run specific version of Dataverse then start containers separately, for example, for French
`docker-compose -f ./docker-multilingual.yml up dataverse_fr`

##### Switching languages in running Dataverse
If you want to switch language you should copy new Bundle.properties file to running Dataverse container and restart:
```
docker cp Bundle_de.properties dataverse:/opt/glassfish4/glassfish/domains/domain1/applications/dataverse/WEB-INF/classes/Bundle.properties
docker exec -it dataverse sh -c  '/opt/glassfish4/glassfish/bin/asadmin stop-domain
docker exec -it dataverse /bin/bash
/opt/glassfish4/glassfish/bin/asadmin start-domain
```
You can find all available Bundle.properties for different languages in dataversedock/lang.properties folder

#### Going from Docker Compose to Kubernetes
If you want to run Dataverse on Kubernetes there is convertor called [Kompose] (https://github.com/kubernetes/kompose)

Install it and run the command:
`kompose convert -f ./docker-multilingual.yml` 

You should see Kubernetes specifications created:

```
INFO Container name in service "dataverse_de" has been changed from "dataverse_de" to "dataverse-de" 
INFO Service name in docker-compose has been changed from "dataverse_de" to "dataverse-de" 
INFO Container name in service "dataverse_es" has been changed from "dataverse_es" to "dataverse-es" 
INFO Service name in docker-compose has been changed from "dataverse_es" to "dataverse-es" 
INFO Container name in service "dataverse_fr" has been changed from "dataverse_fr" to "dataverse-fr" 
INFO Service name in docker-compose has been changed from "dataverse_fr" to "dataverse-fr" 
INFO Container name in service "dataverse_ua" has been changed from "dataverse_ua" to "dataverse-ua" 
INFO Service name in docker-compose has been changed from "dataverse_ua" to "dataverse-ua" 
INFO Kubernetes file "dataverse-service.yaml" created 
INFO Kubernetes file "dataverse-de-service.yaml" created 
INFO Kubernetes file "dataverse-es-service.yaml" created 
INFO Kubernetes file "dataverse-fr-service.yaml" created 
INFO Kubernetes file "dataverse-ua-service.yaml" created 
INFO Kubernetes file "postgres-service.yaml" created 
INFO Kubernetes file "solr-service.yaml" created  
INFO Kubernetes file "dataverse-deployment.yaml" created 
INFO Kubernetes file "dataverse-de-deployment.yaml" created 
INFO Kubernetes file "dataverse-es-deployment.yaml" created 
INFO Kubernetes file "dataverse-fr-deployment.yaml" created 
INFO Kubernetes file "dataverse-ua-deployment.yaml" created 
INFO Kubernetes file "postgres-deployment.yaml" created 
INFO Kubernetes file "postgres-claim0-persistentvolumeclaim.yaml" created 
INFO Kubernetes file "solr-deployment.yaml" created 
INFO Kubernetes file "solr-claim0-persistentvolumeclaim.yaml" created
``` 

Now you can start all created services with kubectl, for example: `kubectl create -f dataverse-deployment.yaml`

#### Deployment using Dataverse image from Docker Hub

* create image out of the installed container with removed temporary files after Dataverse will go up on port 8085:
`docker commit dataversedocker_dataverse`
* Find ID of new image with running (it will show you newly created image on the top of the list):
`docker images`
* Archive this image with command like (for example, imageID is 33c86dbfdc9e):
`docker save 33c86dbfdc9e > dataverse.tar`
* Push this image to Docker Hub, "username" should be your login there:
```
export DOCKER_ID_USER="username"
docker login
docker tag dataversedocker_dataverse $DOCKER_ID_USER/dataverse
docker push $DOCKER_ID_USER/dataverse
```

#### Warning

If not all languages are coming up in the same time please increase RAM for Docker (not less than 10Gb for 5 languages). 

#### To Do

Health check support should be added to get Dataverse installation process from Docker more sustainable.

