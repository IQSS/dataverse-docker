#/bin/bash /opt/payara/init.d/006-s3-aws-storage.sh
#cp -R /secrets/aws-cli/.aws /root/.aws
echo > ${INIT_SCRIPTS_FOLDER}/preboot.payara
echo "create-system-properties dataverse.files.S3.type=s3" >> ${INIT_SCRIPTS_FOLDER}/preboot.payara
echo "create-system-properties dataverse.files.S3.label=S3" >> ${INIT_SCRIPTS_FOLDER}/preboot.payara
echo "create-system-properties dataverse.files.S3.bucket-name=${aws_bucket_name}" >> ${INIT_SCRIPTS_FOLDER}/preboot.payara
echo "create-system-properties dataverse.files.S3.download-redirect=true" >> ${INIT_SCRIPTS_FOLDER}/preboot.payara
echo "create-system-properties dataverse.files.S3.upload-redirect=true" >> ${INIT_SCRIPTS_FOLDER}/preboot.payara
echo "create-system-properties dataverse.files.S3.url-expiration-minutes=120" >> ${INIT_SCRIPTS_FOLDER}/preboot.payara
echo "create-system-properties dataverse.files.S3.connection-pool-size=4096" >> ${INIT_SCRIPTS_FOLDER}/preboot.payara
echo "create-system-properties dataverse.files.storage-driver-id=S3" >> ${INIT_SCRIPTS_FOLDER}/preboot.payara
echo "create-system-properties dataverse.files.S3.profile=${aws_s3_profile}" >> ${INIT_SCRIPTS_FOLDER}/preboot.payara
