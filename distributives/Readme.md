# Dataverse distributives 

You can different Dataverse distributives depending from your use case. To swith distributive point COMPOSE_FILE in your .env file to the yaml file below, for example:
```
COMPOSE_FILE=./docker-compose.yml
```

Available distributives:
* docker-compose.yml (standard http only)
* docker-compose-ssl.yml (standard with letsencrypt https) 
* docker-compose-shibboleth.yml (Shibboleth support included)
