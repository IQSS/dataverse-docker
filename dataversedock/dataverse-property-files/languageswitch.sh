#!/bin/bash
curl http://localhost:8080/api/admin/settings/:Languages -X PUT -d '[{  "locale":"en", "title":"English"},  {  "locale":"fr-FR", "title":"Français"}, {  "locale":"se-SE", "title":"Swedish"}, {  "locale":"sl-SI", "title":"Slovenian"}]'
