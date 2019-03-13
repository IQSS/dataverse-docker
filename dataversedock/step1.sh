#!/bin/sh

wdir=$1"/dataversedock"
echo "Getting all dependencies in "$wdir

if [ ! -d $wdir/dv/deps ]; then
        mkdir -p $wdir/dv
	mkdir -p $wdir/dv/deps
fi

if [ ! -e $wdir/dv/deps/glassfish-4.1.zip ]; then
	echo "glassfish dependency prep"
	mkdir -p /tmp/dv-prep/gf
	cd  $wdir/dv/deps
	wget http://download.java.net/glassfish/4.1/release/glassfish-4.1.zip
	rm glassfish4/glassfish/modules/weld-osgi-bundle.jar
	wget http://search.maven.org/remotecontent?filepath=org/jboss/weld/weld-osgi-bundle/2.2.10.Final/weld-osgi-bundle-2.2.10.Final-glassfish4.jar -O weld-osgi-bundle.jar
fi

if [ ! -e $wdir/dv/deps/solr-7.3.0dv.tgz ]; then
	echo "solr dependency prep"
	# schema changes *should* be the only ones...
	cd $wdir/dv/deps/
	wget https://archive.apache.org/dist/lucene/solr/7.3.0/solr-7.3.0.tgz -O solr-7.3.0dv.tgz
	cd ../../
fi
