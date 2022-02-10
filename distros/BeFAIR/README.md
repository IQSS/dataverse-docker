# BeFAIR
BeFAIR (Be Findable, Accessible, Interoperable, Reusable) Open Science Framework.

BeFAIR is a Common Distributed Research Infrastructure where users can add and run any tools and components by themselves using Debian's way of managing services.
All selected services should be available on a selected subdomain name and could be easily integrated together with [Dataverse](https://dataverse.org), BeFAIR data repository.

BeFAIR was designed as out-of-the-box Distributed Networked Infrastructure that any research community can install with one command just as normal Operating System. The roadmap includes releases containing Open Data available for the different sciences, however [COVID-19 Data Hub](http://datasets.coronawhy.org) is our current priority.

# Acknowledgements
BeFAIR infrastructure is standing the Shoulder of Giants. Please find below the acknowledgements for resources and contributions from the finished on ongoing projects.

Region | Project  | Funding information | Component |
| ------------- | ------------- | ------------- | ------------- |
| European Union | [CESSDA SaW](https://cordis.europa.eu/project/id/674939) | H2020-INFRADEV-1-2015-1, grant agreement #674939 | Dataverse as a service |
| European Union | [SSHOC](https://sshopencloud.eu) | H2020-INFRAEOSC-04-2018, grant agreement #823782 | [Cloud Dataverse](https://www.sshopencloud.eu/news/developing-sshoc-dataverse) |
| European Union | [EOSC Synergy](https://www.eosc-synergy.eu) | INFRAEOSC-05-2018-2019, grant agreement No 857647 | [SQAaaS](https://www.eosc-synergy.eu/home/software-services/) service |
| European Union | [EOSC-hub](https://www.eosc-hub.eu) | H2020-EINFRA-12-2017, grant agreement #777536 | [DataTags](https://github.com/Dans-labs/datatags-service) as a service |
| United States | [INDRA](https://indralab.github.io) | Defense Advanced Research Projects Agency under award W911NF-14-1-0397 | INDRA service |
| European Union | [FAIRsFAIR](https://www.fairsfair.eu) | H2020-INFRAEOSC-2018-2020 Grant agreement 831558 | [F-UJI](https://www.fairsfair.eu/f-uji-automated-fair-data-assessment-tool) and FAIR Data Points |
| Netherlands | [CLARIAH](https://clariah.nl) | NWO grant number: 184.033.101 | CLARIAH as a service |
| Finland | [SKOSMOS](https://finto.fi) | National Library of Finland | SKOSMOS as a service |


# Available and planned services

Available basic infrastructure components:
* traefik
* postgresql
* SOLR

The list of services integrated in BeFAIR:
* [Dataverse](http://github.com/IQSS/dataverse) 
* [Semantic Gateway](https://github.com/Dans-labs/semantic-gateway)
* [Apache Airflow](https://github.com/apache/airflow)
* [INDRA](https://indralab.github.io) (INDRA REST API https://indra.readthedocs.io/en/latest/rest_api.html)
* [Apache Superset](https://github.com/apache/superset) (in progress) 
* [FAIRDataPoint](https://github.com/FAIRDataTeam/FAIRDataPoint) (in progress)
* CoronaWhy API (FastAPI with OpenAPI spec)

To Do (we re accepting Pull Requests, please join the project if you want to contribute!):
* Elasticsearch 
* SPARQL endpoint (Virtuoso as a service)
* Grlc (SPARQL queries into RESTful APIs convertor)
* Doccano 
* Jupyter 
* OCR Tesseract (OCR as a service)
* Kibana 

BeFAIR is using Traefik load balancer and proxy service. Please define traefikhost in the configuration of your distro (see distros/ folder) to start enabled services.

# Citation for the academic use

Please cite this work as follows:

Tykhonov V., Polishko A., Kiulian, A., Komar M. (2020). CoronaWhy: Building a Distributed, Credible and Scalable Research and Data Infrastructure for Open Science. Zenodo. http://doi.org/10.5281/zenodo.3922257

# License

The content of this project itself is licensed under the Creative Commons Attribution 3.0 Unported license, and the underlying source code used to format and display that content is licensed under the MIT license.

