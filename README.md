# dataverse-docker
Dataverse repository for running with Docker in Kubernetes and other Cloud services

# download required software for authomatic Dataverse installation (PostgreSQL, SOLR, Glassfish, Dataverse)
`./initial.bash`
# build all containers with Docker Compose
`docker-compose build`
# Run images
`docker-compose up`
Standalone Dataverse in English should be running on http://localhost:8085

* If you want to start multilingual web interface please run
`docker-compose -f ./docker-multilingual.yml up`

* Check if Dataverse is running
docker ps

You should see all containers now:

CONTAINER ID        IMAGE                                 COMMAND                  CREATED              STATUS              PORTS                                          NAMES

cc84feb9760c        dockereu_dataverse_fr                 "/opt/dv/entrypoint.b"   About a minute ago   Up About a minute   0.0.0.0:446->443/tcp, 0.0.0.0:8088->8080/tcp   dataverse_fr

56229df080d9        dockereu_dataverse_es                 "/opt/dv/entrypoint.b"   About a minute ago   Up About a minute   0.0.0.0:450->443/tcp, 0.0.0.0:8090->8080/tcp   dataverse_es

14d7719ea79e        dockereu_dataverse_de                 "/opt/dv/entrypoint.b"   About a minute ago   Up About a minute   0.0.0.0:447->443/tcp, 0.0.0.0:8086->8080/tcp   dataverse_de

4af3942245ee        dockereu_dataverse_ua                 "/opt/dv/entrypoint.b"   About a minute ago   Up About a minute   0.0.0.0:453->443/tcp, 0.0.0.0:8089->8080/tcp   dataverse_ua

3a30792b22fe        dockereu_dataverse                    "/opt/dv/entrypoint.b"   About a minute ago   Up About a minute   0.0.0.0:440->443/tcp, 0.0.0.0:8085->8080/tcp   dataverse

8903ffab7d79        dockereu_solr                         "/entrypoint.sh solr"    About a minute ago   Up About a minute   0.0.0.0:8985->8983/tcp                         solr

e652e204e6bb        dockereu_postgres                     "docker-entrypoint.sh"   14 minutes ago       Up About a minute   0.0.0.0:5435->5432/tcp                         db

# If you want to run specific version of Dataverse, run containers separately, for example, for French
docker-compose up dataverse_fr

After 15 minutes or so you’ll get localized Dataverses running on localhost:8085, localhost:8086 etc (see specification in .yaml file)
~                                                                                                                                        
