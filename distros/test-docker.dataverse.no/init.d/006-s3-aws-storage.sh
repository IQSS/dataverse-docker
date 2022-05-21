#!/bin/bash

# AWS Bucket for Dataverse
# https://guides.dataverse.org/en/latest/installation/config.html#id90
if [ "${aws_bucket_name}" ]; then
    cp -R /secrets/aws-cli/.aws /root/.aws
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3.type\=s3"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3.label\=S3"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3.bucket-name\=${aws_bucket_name}"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3.download-redirect\=true"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3.url-expiration-minutes\=120"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3.connection-pool-size\=4096"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.storage-driver-id\=S3"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3.profile\=${aws_s3_profile}"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3.custom-endpoint-url\=${aws_endpoint_url}"
    curl -X PUT "http://localhost:8080/api/admin/settings/:DownloadMethods" -d "native/http"
fi
