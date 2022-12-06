#/bin/bash
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
echo "set-log-attributes com.sun.enterprise.server.logging.GFFileHandler.logStandardStreams=true" >> ${INIT_SCRIPTS_FOLDER}/preboot.payara
echo "set-log-attributes com.sun.enterprise.server.logging.GFFileHandler.logtoFile=true" >> ${INIT_SCRIPTS_FOLDER}/preboot.payara
keyid=$(grep 'access key' $aws_config | awk -F ': ' {'print $2'};)
secret_key=$(grep 'secret' $aws_config | awk -F ': ' {'print $2'};)
endpoint=$aws_endpoint_url
echo "create-system-properties dataverse.files.S3.access-key="$keyid >> ${INIT_SCRIPTS_FOLDER}/preboot.payara
echo "create-system-properties dataverse.files.S3.secret-key="$secret_key >> ${INIT_SCRIPTS_FOLDER}/preboot.payara
echo "create-system-properties dataverse.files.S3.custom-endpoint-url=$endpoint" >> ${INIT_SCRIPTS_FOLDER}/preboot.payara
