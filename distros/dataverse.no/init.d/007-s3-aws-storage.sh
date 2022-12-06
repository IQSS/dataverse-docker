#!/bin/bash

# AWS Bucket for Dataverse
# https://guides.dataverse.org/en/latest/installation/config.html#id90
if [ "${aws_uit_bucket_name}" ]; then
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3uit.type\=s3"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3uit.label\=S3uit"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3uit.bucket-name\=${aws_uit_bucket_name}"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3uit.download-redirect\=true"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3uit.upload-redirect=true"
  #  asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3uit.min-part-size=53687091200"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3uit.url-expiration-minutes\=120"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3uit.connection-pool-size\=4096"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3uit.storage-driver-id\=S3uit"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3uit.profile\=${aws_uit_s3_profile}"
  #  asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.S3uit.custom-endpoint-url\=${aws_endpoint_url}"
    curl -X PUT "http://localhost:8080/api/admin/settings/:DownloadMethods" -d "native/http"
fi
