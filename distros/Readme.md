# Dataverse distributives 

You can different Dataverse distributives depending from your use case. To swith to another distributive you should change the variable COMPOSE_FILE in your .env file to the yaml file below. 
For example, edit .env file and change this variable here:
```
COMPOSE_FILE=./docker-compose.yml
```
and apply the specification to run distributive with ssl support:
```
COMPOSE_FILE=./distributives/docker-compose-ssl.yml
``` 

Available distributives (more is coming):
* docker-compose.yml (standard http only)
* docker-compose-ssl.yml (standard with letsencrypt https) 
* docker-compose-shibboleth.yml (Shibboleth support included)
