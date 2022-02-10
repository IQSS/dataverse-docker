# Dataverse distributions
You can use different Dataverse distributions depending from your use case. Dataverse distribution, or distro, is a kind of Open Science system which use Dataverse platform as a core and supporting user programs, libraries and other containers. Every user can create own distro where Dataverse core will be centrally maintained but other components will be customized.

To switch to another distribution you should change the variable COMPOSE_FILE in your .env file to the yaml file below. 
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
