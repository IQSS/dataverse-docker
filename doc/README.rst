The following documentation will guide you through building a custom docker container with a Dataverse project on Microsoft Azure Cloud. DataverseNO uses Docker containers to manage Dataverse deployment and updates.

Motivation for DataverseNO Docker Container
-------------------------------------------

Let assume that you want to deploy an application to a server. In your local test system, the application works just fine without any problem. But when you have deployed the same application into a another server for production or demo, boom! Your application does not work anymore. Many factors can contribute making this happen. It could be the operating system compatibility or different library versions. Therefore, your application could not be deployed successfully, and you will get a lot of challenges. 
Docker will come to your help and will help remove these challenges because of the incompatibility problems.

This documentation will show you how to use Docker to containerize your Dataverse application so you can run them on any servers regardless of their operating system inside of them. DataverseNO test was done on Ubuntu OS on the  Microsoft Azure Cloud.


Requirements & Prerequisites  
----------------------------

SSH to a working VM as the administrator and make sure that you have sudo rights to install.

The DataverseNO Docker Container platform stands on the shoulders of many other software projects. Before running it, the following must be installed and/or configured

- Login to DatavarseNO:

    - [FEIDE SAML / OpenID](https://www.feide.no) - EIDE is a Norwegian governement solution for secure identification in the education sectors. We use FEIDE SAML as our identity management and sing sign on (SSO). FEIDE SAML activates single Sign On (SSO) for our Dataverse application.
    - Azure OpenID - OpenID Connect is a security-token based extension of the OAuth 2.0 authorization protocol to do single sign-on. Azure OpenID supports single sign-on and API access to Dataverse application.
    - [ORCID openID](https://info.orcid.org/ufaqs/) - ORCID openID provides individual researchers and scholars with a persistent unique identifier. ORCID iDs enable reuse of items in new contexts by making connections between items from the same author in different places. Authentication with ORCID is supported in Dataverse. Registration for the production Members API service is open to ORCID members organizations only. UiT is an organisation member and registered with ORCID.
    - [eduGAIN](https://edugain.org) - The eduGAIN interfederation service connects identity federations around the world, simplifying access to content, services and resources for the global research and education community. 
- SMTP server - is used to send, and relay outgoing email between DataverseNO (sender) and receivers. We use UiT smtp server.

- Storage 

    - VM server  - Stores the Dataverse application, custom scripts and configuration files.
    - Cloudian S3 storage - Uses for storing dataset files. Cloudian provides exabyte-scale storage for your capacity-intensive workloads: S3-compatible storage for on-prem, hybrid cloud, and multi-cloud.
    - Blob storage  (mounted on the VM)
    
- [Docker and Docker-compose](https://https://www.docker.com/) -  Docker is an open platform that allows developing, shipping, and running applications by using containers (i.e. packages containing all the parts an application needs to function, such as libraries and dependencies). Containers are isolated from each other and bundle their own software, libraries, and configuration files; they can communicate with each other through well-defined channels. Docker run is entirely command line based, and only start one container at a time. Docker-compose reads configuration data from a YAML file and run multiple containers. 

Steps needed to implementation of DataverseNO Docker Container: 

    1) Installation of Docker on a VM machine, 
    2) Creation of Dockerfile, and
    3) Building images and development of Dockerfile. 

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) - Git is a distributed version control system that tracks changes in any set of computer files, usually used for coordinating work among programmers collaboratively developing source code during software development. DataverseNO users git to track the changes made on files. You can reate a new project/repo or repo from an existing project if it has not be done.

+ [Azure-cli](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) - The Azure Command-Line Interface (CLI) is a cross-platform command-line tool to connect to Azure and execute administrative commands on Azure resources. It allows the execution of commands through a terminal using interactive command-line prompts or a script.
