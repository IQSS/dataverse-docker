
#!/bin/bash

mkdir /opt/payara/counter-processor
cd /opt/payara/counter-processor
wget https://github.com/CDLUC3/counter-processor/archive/v${COUNTERPROSVERSION}.tar.gz -O v${COUNTERPROSVERSION}.tar.gz
tar xvfz v${COUNTERPROSVERSION}.tar.gz
cd /opt/payara/counter-processor/counter-processor-${COUNTERPROSVERSION}
curl "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country&license_key=${GEOIPLICENSE}&suffix=tar.gz" -o GeoLite2-Country.tar.gz \
	  && tar -xzvf GeoLite2-Country.tar.gz \
	    && mv GeoLite2-Country_*/GeoLite2-Country.mmdb /opt/payara/counter-processor/counter-processor-${COUNTERPROSVERSION}/maxmind_geoip

wget https://guides.dataverse.org/en/latest/_downloads/a65ffc2dba9f406858591558ae92790c/setup-counter-processor.sh -O /opt/payara/counter-processor/counter-processor-${COUNTERPROSVERSION}/setup-counter-processor.sh 
wget https://guides.dataverse.org/en/latest/_downloads/fb16fe67897ad9fb85ec67bce5e6b83e/counter-processor-config.yaml -O /opt/payara/counter-processor/counter-processor-${COUNTERPROSVERSION}/counter-processor-config.yaml

curl -X PUT -d '/opt/payara/appserver/glassfish/domains/domain1/logs/makeDataCount' http://localhost:8080/api/admin/settings/:MDCLogPath
curl -X PUT -d 'false' http://localhost:8080/api/admin/settings/:DisplayMDCMetrics

pip3 install -r requirements.txt --ignore-installed PyYAML
export ALLOWED_ENV=year_month

