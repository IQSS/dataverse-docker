#!/bin/bash

# MinIO bucket activation
# https://guides.dataverse.org/en/latest/installation/config.html#id87
if [ "${minio_label_1}" ]; then
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_1}.type\=s3"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_1}.label\=${minio_label_1}"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_1}.bucket-name\=${minio_bucket_1}"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_1}.download-redirect\=false"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_1}.url-expiration-minutes\=120"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_1}.connection-pool-size\=4096"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_1}.profile\=${minio_profile_1}"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_1}.custom-endpoint-url\=http\:\/\/minio\:9016"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_1}.path-style-access\=true"
fi
