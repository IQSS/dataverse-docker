#!/bin/bash
curl -X PUT -d '{"Standard Process":["Curator Assigned", "In Curation", "Awaiting Reply", "Legal or Ethical Concerns", "Awaiting Final Approval", "In Double Blind Review", "Awaiting Article Publication", "Candidate for Deletion"], "Alternate Process":["State 1","State 2","State 3"]}' http://localhost:8080/api/admin/settings/:AllowedCurationLabels
curl -X PUT -d 'STATUSUPDATED' http://localhost:8080/api/admin/settings/:AlwaysMuted
