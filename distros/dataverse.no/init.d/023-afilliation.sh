#!/bin/bash
curl -X PUT -d "affiliation" http://localhost:8080/api/admin/settings/:ShibAffiliationAttribute
curl -X PUT -d "lastAffiliation" http://localhost:8080/api/admin/settings/:ShibAffiliationOrder
#curl -X PUT -d "firstAffiliation" http://localhost:8080/api/admin/settings/:ShibAffiliationOrder
