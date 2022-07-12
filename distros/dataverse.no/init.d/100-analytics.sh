curl -o $DOCROOT_DIR/analytics.xhtml  https://raw.githubusercontent.com/DataverseNO/dataverse-docker/dataverse.no/distros/dataverse.no/modification/analytics.xhtml
curl -X PUT -d $DOCROOT_DIR/analytics.xhtml http://localhost:8080/api/admin/settings/:WebAnalyticsCode
