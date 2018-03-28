#!/bin/sh

# move things necessary for integration tests into build context.
# this was based off the phoenix deployment; and is likely uglier and bulkier than necessary in a perfect world

wdir=$1"/dataversedock"
echo "Getting all dependencies in "$wdir

mkdir -p testdata/doc/sphinx-guides/source/_static/util/
#cp ../solr/4.6.0/schema.xml testdata/
#cp ../../jhove/jhove.conf testdata/

# not using dvinstall.zip for setupIT.bash; but still used in install.bash for normal ops
echo $wdir
cd $wdir
if [ ! -e $wdir/dv/deps/dvinstall.zip ]; then
	wget https://github.com/IQSS/dataverse/releases/download/v4.8.5/dvinstall.zip -O $wdir/dv/deps/dvinstall.zip
fi

if [ ! -e $wdir/dv/deps/dataverse.war ]; then
	wget https://github.com/Dans-labs/dataverse/releases/download/4.8.5-da-ra/dara40.tsv -O $wdir/dv/deps/dara40.tsv
	wget https://github.com/Dans-labs/dataverse/releases/download/4.8.5-da-ra/schema40.xml -O $wdir/dv/deps/schema40.xml
	wget https://github.com/Dans-labs/dataverse/releases/download/4.8.5-da-ra/dara-dv-plugin.zip -O $wdir/dv/deps/dara-dv-plugin.zip
 	wget https://github.com/Dans-labs/dataverse/releases/download/4.8.5-da-ra/dataverse-4.8.5.war -O $wdir/dv/deps/dataverse.war
fi
cd ../
