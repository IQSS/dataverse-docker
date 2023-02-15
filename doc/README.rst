The following documentation will guide you through building a custom docker container with a Dataverse project. DataverseNO uses Docker containers to manage deployment and updates.

1. Motivation for Dataverse Docker Container
--------------------------------------------

Let assume that you want to deploy an application to a server. In your local test system, the application works just fine without any problem. But once you have deployed the application into a server, boom! Your application does not work anymore.
Many factors can contribute that makes this happen. It could be the operating system compatibility or different library versions. Therefore, your application could be deployed, and you will get a lot of challenges. Docker will come to your help and will help remove these challenges because of the incompatibility problem 
This documentation will show you how to use Docker to containerize your Dataverse application so you can run them on any servers regardless of their operating system inside of them. The test is done on Ubuntu OS.

2. What is Docker
-----------------
Docker is an open platform that allows developing, shipping, and running applications by using containers (i.e. packages containing all the parts an application needs to function, such as libraries and dependencies). Containers are isolated from each other and bundle their own software, libraries, and configuration files; they can communicate with each other through well-defined channels.

They are several steps needed to implementation docker: 1) Install Docker on your machine, 2) create a file called Dockerfile, 3) Build the image and development of Dockerfile. 
