Environment variables
=====================

To run Dataverse as a completely operational production service, data providers should fill all settings in the configuration file containing information about their domain name, DOIs settings, the language of web interface, mail relay, external controlled vocabularies and storage. There is also possibility to integrate Docker based custom services in the infrastructure and create own software packages serving the needs of the specific data providers, for example, to integrate a separate Shibboleth container for the federated authentication, install new data previewer or activate data processing pipeline.

Configuration
~~~~~~~~~~~~~

The configuration is managed in the central place in an environmental variables file called .env, so administrators have no need to modify other files in the software package. It contains all necessary settings required to deploy Dataverse, for example, to set the language or web interface, establish connection to the local database, SOLR search engine, mail relay or external storage.


main configuration
------------------

CONFIGURATION_PATH=/distrib/private

DOCROOT=/distrib

VERSION=5.9.1

DOCKER_HUB=presacrd4oilmd5ss77y.azurecr.io/dataverseno

SECRETS_DIR="${CONFIGURATION_PATH}/secrets"

POSTGRESTMP=/mnt/tmp/postgres


Dataverse database settings
---------------------------

DATAVERSE_DB_HOST=postgres

DATAVERSE_DB_USER=dataverse

DATAVERSE_DB_PASSWORD=password

DATAVERSE_DB_NAME=dataverse

solr
----

SOLR_SERVICE_HOST=solr:8983

SOLR_SERVICE_PORT=8983

DATAVERSE_URL=localhost:8080

DATAVERSE_SERVICE_HOST=localhost

LOCAL_STORAGE=/mntblob

Conter Processor
----------------

COUNTERPROSVERSION=0.1.04

GEOIPLICENSE=licencekey

CONFIG_FILE=counter-processor-config.yaml

Postgres settings
-----------------

POSTGRES_USER=dataverse

POSTGRES_PASSWORD=

POSTGRES_SERVER=postgres

POSTGRES_DATABASE=dataverse

POSTGRES_DB=dataverse

Domain configuration and init folder
------------------------------------

hostname=test-docker.dataverse.no

traefikhost=test-docker.dataverse.no

INIT_SCRIPTS_FOLDER=/opt/payara/init.d

Webhook configuration to bundle external services 
-------------------------------------------------

WEBHOOK=/opt/payara/triggers/external-services.py

#CESSDA=True

#CLARIN=True

DOI parameters
--------------

# https://guides.dataverse.org/en/latest/installation/config.html#doi-baseurlstring

doi_authority=10.21337

doi_provider=DataCite

doi_username=username

doi_password=password

dataciterestapiurlstring=https\:\/\/api.test.datacite.org

baseurlstring=https\:\/\/mds.test.datacite.org

AWS settings
------------

# https://guides.dataverse.org/en/latest/installation/config.html#id90

aws_bucket_name=2002-green-dataversenotest1

aws_s3_profile=cloudian

aws_endpoint_url=https\:\/\/s3-oslo.educloud.no

AWS UiT
---------

aws_uit_bucket_name=p-uit-dataverse01-sth

aws_uit_s3_profile=uit

#aws_endpoint_url=https\:\/\/s3-oslo.educloud.no

Mail relay
---------

# https://guides.dataverse.org/en/latest/developers/troubleshooting.html

system_email=<admin@localhost>

mailhost=smtp-relay.exemple.com

mailuser=no-reply@dataverse.no

no_reply_email=no-reply@dataverse.no

smtp_password=password

smtp_port=465

socket_port=465

Federated authentification file
-------------------------------

# https://guides.dataverse.org/en/latest/installation/shibboleth.html

federated_json_file=/secrets/openid.json

