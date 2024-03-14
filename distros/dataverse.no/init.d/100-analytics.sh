curl -z -o $DOCROOT_DIR/analytics.xhtml  https://raw.githubusercontent.com/DataverseNO/dataverse-docker/dataverse.no/distros/dataverse.no/modification/analytics.xhtml

if [ ! -z "$WEBANALYTICSON" ]
then
      curl -X PUT -d $DOCROOT_DIR/analytics.xhtml http://localhost:8080/api/admin/settings/:WebAnalyticsCode
fi
