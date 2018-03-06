#!/bin/bash

git clone https://github.com/IQSS/dataverse
wdir=`pwd`
echo "Downloading all software required to run Dataverse from path ".$wdir
cd dataversedock
./step1.sh $wdir
./step2.sh $wdir
cd ../

if [ ! -e ./postgresql/dvinstall.zip ]; then
	cp -R ./dataversedock/dv/deps/dvinstall.zip ./postgresql/dvinstall.zip
fi

#docker-compose build postgres
#docker-compose start postgres
#docker-compose build solr
#docker-compose start solr
