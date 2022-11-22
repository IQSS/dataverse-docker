#!/bin/bash

export PGPASSWORD=`cat /secrets/db/password`
psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/read_text_plain.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`

if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"Read Text\", \"description\":\"Read the text file.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/TextPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"text/plain\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/view_html_type.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"View Html\", \"description\":\"View the html file.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/HtmlPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"text/html\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/play_audio_mp3.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"Play Audio\", \"description\":\"Listen to an audio file.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/AudioPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"audio/mp3\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/play_audio_mpeg.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"Play Audio\", \"description\":\"Listen to an audio file.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/AudioPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"audio/mpeg\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/play_audio_wav.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"Play Audio\", \"description\":\"Listen to an audio file.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/AudioPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"audio/wav\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/play_audio_ogg.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"Play Audio\", \"description\":\"Listen to an audio file.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/AudioPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"audio/ogg\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/view_image_gif.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"View Image\", \"description\":\"Preview an image file.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/ImagePreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"image/gif\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/view_image_jpeg.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"View Image\", \"description\":\"Preview an image file.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/ImagePreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"image/jpeg\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/view_image_png.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"View Image\", \"description\":\"Preview an image file.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/ImagePreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"image/png\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/view_pdf.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"Read Document\", \"description\":\"Read a pdf document.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/PDFPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"application/pdf\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/play_video_mp4.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"Play Video\", \"description\":\"Watch a video file.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/VideoPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"video/mp4\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/play_video_ogg.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"Play Video\", \"description\":\"Watch a video file.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/VideoPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"video/ogg\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/play_video_quicktime.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"Play Video\", \"description\":\"Watch a video file.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/VideoPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"video/quicktime\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/view_csv.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"View Data\", \"description\":\"View the spreadsheet data.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/SpreadsheetPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"text/csv\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/view_csv_tabular.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"View Data\", \"description\":\"View the spreadsheet data.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/SpreadsheetPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"text/comma-separated-values\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/view_tsv.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"View Data\", \"description\":\"View the spreadsheet data.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/SpreadsheetPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"text/tab-separated-values\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/view_stata.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"View Stata File\", \"description\":\"View the Stata file as text.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/TextPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"application/x-stata-syntax\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/view_r_file.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"View R file\", \"description\":\"View the R file as text.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/TextPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"type/x-r-syntax\" }"
fi

psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/affiliations/view_hypothesis.sql -o /tmp/toolexist.status
EXIST=`grep '0 rows' /tmp/toolexist.status`
if [[ -n $EXIST ]]; then
    curl -X POST -H 'Content-type: application/json' http://localhost:8080/api/admin/externalTools -d \ "{ \"displayName\":\"View Annotations\", \"description\":\"View the annotation entries in a file.\", \"scope\":\"file\", \"type\":\"explore\", \"hasPreviewMode\":\"true\", \"toolUrl\":\"https://gdcc.github.io/dataverse-previewers/previewers/v1.2/HypothesisPreview.html\", \"toolParameters\": { \"queryParameters\":[ {\"fileid\":\"{fileId}\"}, {\"siteUrl\":\"{siteUrl}\"}, {\"key\":\"{apiToken}\"}, {\"datasetid\":\"{datasetId}\"}, {\"datasetversion\":\"{datasetVersion}\"}, {\"locale\":\"{localeCode}\"} ] }, \"contentType\":\"application/x-json-hypothesis\" }"
fi


