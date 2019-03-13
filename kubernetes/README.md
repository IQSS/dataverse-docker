# Dataverse-EU on GCP


## Getting Started

These instructions should get you up and running on Google Cloud Platform for development and testing purposes.
### Prerequisites

* A Google Cloud Platform (GCP) account and a Project running on GCP. 

* The 'kubectl' and 'gcloud' CLI installed locally.

### Deploying

* Reserve a Global Static IP Address [google docs](https://cloud.google.com/compute/docs/ip-addresses/reserve-static-external-ip-address), and name it: "dataverse-eu-dev-ingress". Name can be changed in: ```
./ingress/dataverse-dev-ingress.yaml```

* Point your c-name(s) to the Global Static IP Address (DNS).

* Depending on the c-names choosen, you should create and/or adjust the yaml descriptor-files to your needs. Files to look for:
```
./deployments/dataverse-dev-dv-*.yaml
./letsencrypt/dataverse-dev-letsencrypt.yaml
./ingress/dataverse-dev-ingress.yaml 
```


Create a Kubernetes Cluster in your GCP project, for example:

```
$ gcloud container --project $GCP_PROJECT clusters create $GCP_CLUSTERNAME --zone $GCP_ZONE --username "admin" --machine-type "n1-standard-2" --image-type "COS" --disk-size "100" --scopes "https://www.googleapis.com/auth/cloud-platform" --num-nodes "1" --enable-cloud-logging --enable-cloud-monitoring
```

Create a Standard persistent disk in your GCP project for Persistent Storage:

```
$ gcloud compute --project=$GCPPROJECT disks create dataverse-disk --zone=europe-west1-b --type=pd-standard --size=200GB
```

Create the Kubernetes namespace, persistentvolume, services, deployments, the mailrelay (if needed), the ingress and the certbot-letsencrypt certificates.


```
➜  k8s kubectl apply -f ./namespace
➜  k8s kubectl apply -f ./persistentvolume
➜  k8s kubectl apply -f ./services
➜  k8s kubectl apply -f ./deployments
➜  k8s kubectl apply -f ./mailrelay
➜  k8s kubectl apply -f ./ingress
```
**Certbot/Letsencrypt note:**
You can use your own SSL certificates or use certbot/letsencrypt to do the SSL certification registration for you. Create the certbot cronjob by: 

```
➜  k8s kubectl apply -f ./letsencrypt

```
You should now have created the following workloads:

* dataverse-en (Deployment)
* bridge (Deployment)
* letsencrypt-cronjob (Cron Job)
* mailrelay (Deployment)
* postgres (Deployment)
* solr (Deployment)

Exposed by the following services:

* dataverse-en (Node Port)
* bridge (Cluster IP)
* dataverse-dev-ingress-service (Ingress)
* letsencrypt	(Node Port)
* mailrelay (Cluster IP)
* postgres (Cluster IP)
* solr (Cluster IP)

PersistentVolumeClaims created:

 * dataverse-pvc	 (volume: dataverse-pv)
 * dataverse-storage (file storage)
 * solr-storage (index)
 * postgres-storage (Postgres database)
 * letsencrypt-storage (SSL certs & renewal info)

Secret/config:

* letsencrypt-certs (Secret)