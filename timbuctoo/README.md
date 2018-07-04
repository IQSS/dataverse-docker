## Timbuctoo extension for CESSDA controlled vocabularies
This software is developed and supported by the [Huygens Institute](http://huygens.knaw.nl) in the Netherlands.

### Installation
If you want to use European Language Social Science Thesaurus (ELSST) you should request it from [UKDA](https://elsst.ukdataservice.ac.uk/elsst-guide) in the form of .nt triples: ElsstTriples*.nt (* indicates version number). 
Then copy ElsstTriples*.nt to timbuctoo folder:
```
cp ElsstTriples*.nt ./timbuctoo/
```
You should use docker-compose-elsst.yml as basic configuration file to build Dataverse with Timbuctoo
```
docker-compose -f docker-compose-elsst.yml build
docker-compose -f docker-compose-elsst.yml up
```
### Usage
GraphiQL web interface will be available here: http://localhost:8090/static/graphiql. It allows visual data discovery of ELSST thesaurus to investigate relations between terms in different languages.  


The thesaurus covers the core social science disciplines: politics, sociology, economics, education, law, crime, demography, health, employment, information and communication technology and, increasingly, environmental science.
It is currently available in 13 languages: Danish, Czech, English, Finnish, French, German, Greek, Lithuanian, Norwegian, Romanian, Slovenian, Spanish, and Swedish.


Timbuctoo API will deliver terms to Dataverse instances available in other languages than English. Depositors will get possibility to fill metadata with standardized values in their own language. 
