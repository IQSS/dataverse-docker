## Timbuctoo extension for CESSDA controlled vocabularies
This software is developed and supported by the http://huygens.knaw.nl[Huygens Institute] in the Netherlands.

### Installation
Copy ElsstTriples*.nt to timbuctoo folder:
```
cp ElsstTriples*.nt ./timbuctoo/
```
You should use docker-compose-elsst.yml as basic configuration file to build Dataverse with Timbuctoo
```
docker-compose -f docker-compose-elsst.yml build
docker-compose -f docker-compose-elsst.yml up
```

