#!/bin/bash

# Enable file folder in local storage
asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.file.type\=file"
asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.file.label\=file"
asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} create-jvm-options "-Ddataverse.files.file.directory\=/data"
