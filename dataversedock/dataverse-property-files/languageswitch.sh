#!/bin/bash
curl http://localhost:8080/api/admin/settings/:Languages -X PUT -d '[{ "locale":"en", "title":"English"}, {"locale":"sl-SI", "title": "Slovenian"},  {"locale":"de-AT", "title": "German"},  {"locale":"fr-FR", "title":"French"}, {  "locale":"se-SE", "title":"Swedish" }]'
