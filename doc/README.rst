The following documentation will guide you through building a custom docker container with a Dataverse project on Microsoft Azure Cloud. DataverseNO uses Docker containers to manage Dataverse deployment and updates.

Motivation for DataverseNO Docker Container
-------------------------------------------

Let assume that you want to deploy an application to a server. In your local test system, the application works just fine without any problem. But when you have deployed the same application into a another server for production or demo, boom! Your application does not work anymore. Many factors can contribute to make this happen. It could be the operating system compatibility or different library versions. Therefore, your application could not be deployed, and you will get a lot of challenges. 
Docker will come to your help and will help remove these challenges because of the incompatibility problems.

This documentation will show you how to use Docker to containerize your Dataverse application so you can run them on any servers regardless of their operating system inside of them. DataverseNO test is done on Ubuntu OS on the  Microsoft Azure Cloud.


Prerequisites & Requirements
----------------------------

The DataverseNO Docker Container platform stands on the shoulders of many other software projects. Before running it, the following must be installed and/or configured

- login
- SMTP server
- Feide saml / openID
- Azure openID
- [ORCID openID](https://info.orcid.org/ufaqs/) - ORCID openID provides individual researchers and scholars with a persistent unique identifier. ORCID iDs enable reuse of items in new contexts by making connections between items from the same author in different places.
- Storage - Cloudian
- Blob storage  (monted on the VM)
- S3 storage for storng dataset files stored in Cloudian. Cloudian provides exabyte-scale storage for your capacity-intensive workloads: S3-compatible storage for on-prem, hybrid cloud, and multi-cloud. (an object storage fo

- [Docker and Docker-compose](https://https://www.docker.com/) -  Docker is an open platform that allows developing, shipping, and running applications by using containers (i.e. packages containing all the parts an application needs to function, such as libraries and dependencies). Containers are isolated from each other and bundle their own software, libraries, and configuration files; they can communicate with each other through well-defined channels. Docker run is entirely command line based, and only start one container at a time. Docker-compose reads configuration data from a YAML file and run multiple containers.

    They are several steps needed to implementation DataverseNO Docker Container: 

    1) Installation of Docker on our VM machine, 

    2) Creation of Dockerfile, and

    3) Building images and development of Dockerfile. 

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) - Git is a distributed version control system that tracks changes in any set of computer files, usually used for coordinating work among programmers collaboratively developing source code during software development. DataverseNO users git to track the changes made on files

+ [Azure-cli](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) - The Azure Command-Line Interface (CLI) is a cross-platform command-line tool to connect to Azure and execute administrative commands on Azure resources. It allows the execution of commands through a terminal using interactive command-line prompts or a script.

Prerequisites: SSH to the working VM as the administrator and make sure that you have sudo rights to install.



