#!/bin/bash
curl -X PUT -d "affiliation" http://localhost:8080/api/admin/settings/:ShibAffiliationAttribute
curl -X PUT -d True http://localhost:8080/api/admin/settings/ShibAffiliationFeide

