#!/bin/sh

wdir="/opt"
if [ ! -e $wdir/dv/deps/glassfish4dv.tgz ]; then
        echo "glassfish dependency prep"
        mkdir -p /tmp/dv-prep/gf
        cd  $wdir/dv/deps
#        wget http://download.java.net/glassfish/4.1/release/glassfish-4.1.zip
#        wget http://search.maven.org/remotecontent?filepath=org/jboss/weld/weld-osgi-bundle/2.2.10.Final/weld-osgi-bundle-2.2.10.Final-glassfish4.jar -O weld-osgi-bundle-2.2.10.Final-glassfish4.jar
        unzip glassfish-4.1.zip
        rm glassfish4/glassfish/modules/weld-osgi-bundle.jar
        mv weld-osgi-bundle-2.2.10.Final-glassfish4.jar glassfish4/glassfish/modules
        tar zcf $wdir/dv/deps/glassfish4dv.tgz glassfish4
	mv glassfish4 $wdir/
        # assuming that folks usually have /tmp auto-clean as needed
fi
