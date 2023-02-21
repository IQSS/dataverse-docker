#!/bin/bash
curl -X PUT -d 'native/http,dvwebloader' http://localhost:8080/api/admin/settings/:UploadMethods
curl -X PUT -d 'https://gdcc.github.io/dvwebloader/src/dvwebloader.html' http://localhost:8080/api/admin/settings/:WebloaderUrl

