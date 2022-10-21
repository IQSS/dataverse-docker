curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName": "Dataverse WebLoader",
  "description": "Upload all  the files in a local directory!",
  "toolName": "dvwebloader",
  "scope": "dataset",
  "contentType":"text/plain",
  "types": [
    "explore"
  ],
  "toolUrl": "https://gdcc.github.io/dvwebloader/src/dvwebloader.html",
  "toolParameters": {
    "queryParameters": [
      {
        "siteUrl": "{siteUrl}"
      },
      {
        "datasetPid": "{datasetPid}"
      },
      {
        "key": "{apiToken}"
      }
    ]
  }
}'
