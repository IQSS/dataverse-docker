#!/bin/bash


#https://raw.githubusercontent.com/DataverseNO/dataverse-previewers/develop/6.1curlcommands.md
# Example Curl Commands to register previewers for Dataverse, version 5.13+

for id in $(curl -s http://localhost:8080/api/admin/externalTools | jq -r .data[].id); do curl -X DELETE "http://localhost:8080/api/admin/externalTools/$id";done

curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Read Text",
  "description":"Read the text file.",
  "toolName":"textPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/TextPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"text/plain",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"View Html",
  "description":"View the html file.",
  "toolName":"htmlPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/HtmlPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"text/html",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'




curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Play Audio",
  "description":"Listen to an audio file.",
  "toolName":"audioPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/AudioPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"audio/mp3",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Play Audio",
  "description":"Listen to an audio file.",
  "toolName":"audioPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/AudioPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"audio/mpeg",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Play Audio",
  "description":"Listen to an audio file.",
  "toolName":"audioPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/AudioPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"audio/wav",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Play Audio",
  "description":"Listen to an audio file.",
  "toolName":"audioPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/AudioPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"audio/ogg",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Play Audio",
  "description":"Listen to an audio file.",
  "toolName":"audioPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/AudioPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"audio/x-m4a",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"View Image",
  "description":"Preview an image file.",
  "toolName":"imagePreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/ImagePreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"image/gif",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"View Image",
  "description":"Preview an image file.",
  "toolName":"imagePreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/ImagePreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"image/jpeg",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"View Image",
  "description":"Preview an image file.",
  "toolName":"imagePreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/ImagePreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"image/png",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Read Document",
  "description":"Read a pdf document.",
  "toolName":"pdfPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/PDFPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"application/pdf",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Play Video",
  "description":"Watch a video file.",
  "toolName":"videoPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/VideoPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"video/mp4",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Play Video",
  "description":"Watch a video file.",
  "toolName":"videoPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/VideoPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"video/ogg",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Play Video",
  "description":"Watch a video file.",
  "toolName":"videoPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/VideoPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"video/quicktime",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"View Data",
  "description":"View the spreadsheet data.",
  "toolName":"spreadsheetPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/SpreadsheetPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"text/comma-separated-values",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"View Data",
  "description":"View the spreadsheet data.",
  "toolName":"spreadsheetPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/SpreadsheetPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"text/tab-separated-values",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"View Data",
  "description":"View the spreadsheet data.",
  "toolName":"spreadsheetPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/SpreadsheetPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"text/csv",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"View Data",
  "description":"View the spreadsheet data.",
  "toolName":"spreadsheetPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/SpreadsheetPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"text/tsv",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"View Stata File",
  "description":"View the Stata file as text.",
  "toolName":"stataPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/TextPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"application/x-stata-syntax",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"View R file",
  "description":"View the R file as text.",
  "toolName":"rPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/TextPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"type/x-r-syntax",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"View Annotations",
  "description":"View the annotation entries in a file.",
  "toolName":"annotationPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/HypothesisPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"application/x-json-hypothesis",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'


curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"View Map",
  "description":"View a map of the file.",
  "toolName":"mapPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/MapPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"application/geo+json",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'


### MapViewer:

curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"View Map",
  "description":"View a map of the file.",
  "toolName":"mapPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/MapPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"application/geo+json",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'


### ZIP Previewer:

curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Preview Zip file",
  "description":"Preview the structure of a Zip file.",
  "toolName":"zipPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/ZipPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"application/zip",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Preview ELN file",
  "description":"Preview the structure of an ELN Archive.",
  "toolName":"zipPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/ZipPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"application/vnd.eln+zip",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'


### NcML Previewer:


curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Show NcML (XML)",
  "description":"Metadata from HDF5 files.",
  "toolName":"ncmlPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/NcmlPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "requirements": {
    "auxFilesExist": [
      {
        "formatTag": "NcML",
        "formatVersion": "0.1"
      }
    ]
  },
  "contentType":"application/x-hdf5",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Show NcML (XML)",
  "description":"Metadata from NetCDF files.",
  "toolName":"ncmlPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/NcmlPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "requirements": {
    "auxFilesExist": [
      {
        "formatTag": "NcML",
        "formatVersion": "0.1"
      }
    ]
  },
  "contentType":"application/netcdf",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'


### H5Web Previewer for HDF5 and NetCDF files:


curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"H5Web",
  "description":"Explore and visualize HDF5 files",
  "toolName":"HDF5Preview",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/HDF5Preview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"application/x-hdf5",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"H5Web",
  "description":"Explore and visualize HDF5 files",
  "toolName":"HDF5Preview",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/HDF5Preview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"application/netcdf",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'


### Markdown Previewer


curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Show Markdown (MD)",
  "description":"View the Markdown file.",
  "toolName":"mdPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/MdPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"text/markdown",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'

### ESRI Shape Previewer (beta)

curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"View Map",
  "description":"View a map of the file.",
  "toolName":"mapShpPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/MapShpPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"application/zipped-shapefile",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'


### GeoTIFF Previewer (beta)


curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"View Map",
  "description":"View a map of the file.",
  "toolName":"mapShpPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/MapRasterPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"image/tiff",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'


### Rich HTML Previewer - Potential Issues if used with malicious content.

curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Rich HTML Previewer",
  "description":"View the html file and run potentially malicious JavaScript. Useful for interactive HTML files that use e.g. Plotly",
  "toolName":"richHtmlPreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/RichHtmlPreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"text/html",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'



### RO-Crate Previewer (beta)

curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \
'{
  "displayName":"Show RO-Crate",
  "description":"View the RO-Crate metadata file.",
  "toolName":"rocratePreviewer",
  "scope":"file",
  "types":["preview"],
  "toolUrl":"https://dataverseno.github.io/dataverse-previewers/previewers/v1.4/ROCratePreview.html",
  "toolParameters": {
      "queryParameters":[
        {"fileid":"{fileId}"},
        {"siteUrl":"{siteUrl}"},
        {"datasetid":"{datasetId}"},
        {"datasetversion":"{datasetVersion}"},
        {"locale":"{localeCode}"}
      ]
    },
  "contentType":"application/ld+json; profile=\"http://www.w3.org/ns/json-ld#flattened http://www.w3.org/ns/json-ld#compacted https://w3id.org/ro/crate\"",
  "allowedApiCalls": [
    {
      "name": "retrieveFileContents",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=true",
      "timeOut": 3600
    },
    {
      "name": "downloadFile",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/access/datafile/{fileId}?gbrecs=false",
      "timeOut": 3600
    },
    {
      "name": "getDatasetVersionMetadata",
      "httpMethod": "GET",
      "urlTemplate": "/api/v1/datasets/{datasetId}/versions/{datasetVersion}",
      "timeOut": 3600
    }
  ]
}'


