#!/bin/bash

if [[ -z $EMAIL || -z $DOMAINS || -z $SECRET || -z $GCP_PROJECT || -z $GCP_ZONE || -z $GCP_CLUSTER ]]; then
	echo "EMAIL, DOMAINS, GCP_PROJECT, GCP_ZONE, GCP_CLUSTER and SECRET env vars required"
	env
	exit 1
fi

NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)
PWD=$(pwd)

echo "Start inputs:"
echo "EMAIL: $EMAIL"
echo "DOMAINS: $DOMAINS"
echo "SECRET: $SECRET"
echo "GCP_PROJECT: $GCP_PROJECT"
echo "GCP_ZONE: $GCP_ZONE"
echo "GCP_CLUSTER: $GCP_CLUSTER"
echo "HOME: $HOME"
echo "NAMESPACE: $NAMESPACE"
echo "PWD: $PWD"


python -m SimpleHTTPServer 80 &
PID=$!

echo "Getting cluster credentials for $GCP_CLUSTER"
gcloud container clusters get-credentials $GCP_CLUSTER --zone $GCP_ZONE --project $GCP_PROJECT


echo "Pauzing for 30 secs, to get service in place..."
sleep 30s

# No action is taken if no need to renew certs:
echo "Starting certbot..."
certbot certonly --standalone --pre-hook "kill $PID" --preferred-challenges http -n --agree-tos --email ${EMAIL} --no-self-upgrade -d ${DOMAINS}

echo "Certbot finished."

echo "Finding certs. Exiting if certs are not found ..."
CERTPATH=/etc/letsencrypt/live/$(echo $DOMAINS | cut -f1 -d',')
ls $CERTPATH || exit 1


echo "Creating update for secret..."
cat /secret-patch-template.json | \
    sed "s/NAMESPACE/${NAMESPACE}/" | \
    sed "s/NAME/${SECRET}/" | \
    sed "s/TLSCERT/$(cat ${CERTPATH}/fullchain.pem | base64 | tr -d '\n')/" | \
    sed "s/TLSKEY/$(cat ${CERTPATH}/privkey.pem |  base64 | tr -d '\n')/" \
    > /secret-patch.json

echo "Checking json file exists. Exiting if not found..."
ls /secret-patch.json || exit 1

# TODO: Only apply secret if renewal succeeded.
# Update Ingress Secret:
echo "Start applying secret $SECRET to the cluster."
kubectl apply -f ./secret-patch.json


echo "Done"