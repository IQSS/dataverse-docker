# Dataverse distributions
You can use different Dataverse distributions depending from your use case. To swith to another distribution you should change the variable COMPOSE_FILE in your .env file to the yaml file below. 
For example, edit .env file and change this variable here:
```
COMPOSE_FILE=./docker-compose.yml
```
Apply the specification to run distribution with ssl support:
```
COMPOSE_FILE=./distros/docker-compose-ssl.yml
``` 

Available distributions (more is coming):
* docker-compose.yml (standard http only)
* BeFAIR (with FAIR assessment)
* docker-compose-ssl.yml (standard with letsencrypt https) 
* docker-compose-shibboleth.yml (Shibboleth support included)
