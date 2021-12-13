# DANS-KNAW External services webhook
# Please plug-in any service here to do processing and archiving of the published dataset 
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
import select
import json, requests
import subprocess
import os
import re

try:
    WEBHOOKDEBUG = os.environ['WEBHOOKDEBUG']
except:
    WEBHOOKDEBUG = False

conn = psycopg2.connect(host=os.environ['DATAVERSE_DB_HOST'], dbname=os.environ['DATAVERSE_DB_NAME'], user=os.environ['DATAVERSE_DB_USER'], password=os.environ['DATAVERSE_DB_PASSWORD'])
conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
cur = conn.cursor()

cur.execute("LISTEN released_versionstate_datasetversion;")
print("Waiting for notifications on channel 'released_versionstate_datasetversion'")

r = None
while True:
    if select.select([conn], [], [], 10) == ([], [], []):
        # print("More than 10 seconds passed...")
        pass
    else:
        conn.poll()
        while conn.notifies:
            notify = conn.notifies.pop(0)
            print(f"Got NOTIFY: {notify.channel} - {notify.payload}")
            json_data = json.loads(notify.payload)
            data = json_data['data']
            # [{'id': 4, 'protocol': 'doi', 'authority': '10.80227', 'identifier': 'test-NQB1HB', 'versionstate': 'RELEASED', 'versionnumber': 5, 'publicationdate': '2021-12-05T18:02:49.742', 'minorversionnumber': 0}]
            # http://ddvn.dans.knaw.nl:8080/api/datasets/export?exporter=dataverse_json&persistentId=doi%3A10.80227/test-NQB1HB
            if data is not None:
                if WEBHOOKDEBUG:
                    print(data)
                # Try to retrieve exported json
                url = "http://" + os.environ['DATAVERSE_URL'] + "/api/datasets/export?exporter=dataverse_json&persistentId=" + data[0]['protocol'] + ":" + data[0]['authority'] + "/" + data[0]['identifier']
                if WEBHOOKDEBUG:
                    print(url)
                response = requests.get(url)
                exported_dv_json = str(response.text)
                if WEBHOOKDEBUG:
                   print(exported_dv_json)
                identifier = data[0]['identifier']
                identifier = identifier.replace('/', '_')
                f_exported_dv_json = '/tmp/' + identifier + '.json'
                f_cimdi_output = '/tmp/' + identifier + '.xml'
                with open(f_exported_dv_json, 'w') as f:
                    f.write(exported_dv_json)

                # Connect any services here:
                #result = subprocess.run([
                #    'java -cp ../../resources/saxon/saxon-he-10.5.jar net.sf.saxon.Transform -t -s:' + f_exported_dv_json + ' -xsl:' + '../../resources/xslt/dv_to_cimdi.xslt' + ' -o:' + f_cimdi_output], shell=True, capture_output=True, text=True)
