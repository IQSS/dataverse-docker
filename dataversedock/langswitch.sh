#!/bin/bash

if [ $LANGSWITCH ]; then
    cp /opt/dv/dataverse_header.xhtml /opt/glassfish4/glassfish/domains/domain1/applications/dataverse/dataverse_header.xhtml
    echo ""
    echo "header.languages.multi=true"
    echo "header.languages.current=$LANG"
    echo "header.languages.dropdown=$LANGSWITCH"
fi
