#!/bin/bash

# MinIO bucket 2 activation
# https://guides.dataverse.org/en/latest/installation/config.html#id87
if [ "${minio_label_2}" ]; then
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_2}.type\=s3"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_2}.label\=${minio_label_2}"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_2}.bucket-name\=${minio_bucket_2}"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_2}.download-redirect\=false"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_2}.url-expiration-minutes\=120"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_2}.connection-pool-size\=4096"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_2}.profile\=${minio_profile_2}"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_2}.custom-endpoint-url\=http\:\/\/minio\:9016"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.${bucketname_2}.path-style-access\=true"
fi
