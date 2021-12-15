#!/bin/bash

# MinIO bucket activation
# https://guides.dataverse.org/en/latest/installation/config.html#id87
if [ "${minio_label_1}" ]; then
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.Minio.type=s3"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.Minio.label=${minio_label_1}"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.Minio.bucket-name=${minio_bucket_1}"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.Minio.download-redirect=false"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.Minio.url-expiration-minutes=120"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.Minio.connection-pool-size=4096"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.Minio.profile=${minio_profile_1}"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.Minio.custom-endpoint-url=http\:\/\/minio\:9016"
    asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.Minio.path-style-access=true"
fi
