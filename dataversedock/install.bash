#!/usr/bin/env bash
sudo -u postgres createuser --superuser dvnapp
#./entrypoint.bash &
unzip dvinstall.zip
cd dvinstall/
patch -R install < ../docker.patch
./install -admin_email=pameyer+dvinstall@crystal.harvard.edu -y -f > install.out 2> install.err
curl https://raw.githubusercontent.com/scholarsportal/SP-dataverse/SP_v4.7.1/src/main/java/Bundle_fr.properties > /opt/glassfish4/glassfish/domains/domain1/applications/dataverse/WEB-INF/classes/Bundle.properties

echo "installer complete"
cat install.err
