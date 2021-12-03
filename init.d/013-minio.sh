#!/bin/bash

asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.MinioUiB.type=s3"
asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.MinioUiB.label=${minio_label_2}"
asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.MinioUiB.bucket-name=${minio_bucket_2}"
asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.MinioUiB.download-redirect=false"
asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.MinioUiB.url-expiration-minutes=120"
asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.MinioUiB.connection-pool-size=4096"
asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.MinioUiB.profile=${minio_profile_2}"
asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.MinioUiB.custom-endpoint-url=http\:\/\/minio\:9016"
asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "\-Ddataverse.files.MinioUiB.path-style-access=true"
