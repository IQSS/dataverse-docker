The following documentation will guide you through building a custom docker container with a Dataverse project on Microsoft Azure Cloud. DataverseNO uses Docker containers to manage Dataverse deployment and updates.

1. Motivation for Dataverse Docker Container
--------------------------------------------

Let assume that you want to deploy an application to a server. In your local test system, the application works just fine without any problem. But when you have deployed the same application into a another server for production or demo, boom! Your application does not work anymore. Many factors can contribute to make this happen. It could be the operating system compatibility or different library versions. Therefore, your application could not be deployed, and you will get a lot of challenges. 
Docker will come to your help and will help remove these challenges because of the incompatibility problems.

This documentation will show you how to use Docker to containerize your Dataverse application so you can run them on any servers regardless of their operating system inside of them. DataverseNO test is done on Ubuntu OS on the  Microsoft Azure Cloud.

2. What is Docker?
-----------------
Docker is an open platform that allows developing, shipping, and running applications by using containers (i.e. packages containing all the parts an application needs to function, such as libraries and dependencies). Containers are isolated from each other and bundle their own software, libraries, and configuration files; they can communicate with each other through well-defined channels.

They are several steps needed to implementation DataverseNO Docker Container: 
1) Installation of Docker on our VM machine, 
2) Creation of Dockerfile, and
3) Building images and development of Dockerfile. 
