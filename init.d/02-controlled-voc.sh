if [ "${CVM_SERVER_NAME}" ]; then
    echo "Uploading ${CVM_SERVER_NAME} metadatablock" >> /tmp/status.log
    curl http://localhost:8080/api/admin/datasetfield/load -X POST --data-binary @data/metadatablocks/cvmm.tsv -H "Content-type: text/tab-separated-values"

    #curl -H "Content-Type: application/json" -X PUT --data-binary @data/cvm-setting.json "$SERVER/admin/settings/:CVMConf"
    echo "Uploading cvm-setting.json" >> /tmp/status.log

fi

if [ "${CVM_CONFIG}" ]; then
    echo "Dowload keywords configuration file from ${CVM_TSV_SOURCE}" >> /tmp/status.log;
    wget -O ${HOME_DIR}/dvinstall/data/metadatablocks/keys_config.json ${CVM_CONFIG}
    wget -O ${HOME_DIR}/dvinstall/data/metadatablocks/cvm.sql ${CVM_SQL}
    curl -H "Content-Type: application/json" -X PUT --data-binary @${HOME_DIR}/dvinstall/data/metadatablocks/keys_config.json http://localhost:8080/api/admin/settings/:CVMConf
    psql -U dvnuser dvndb -h postgres -f ${HOME_DIR}/dvinstall/data/metadatablocks/cvm.sql
fi

