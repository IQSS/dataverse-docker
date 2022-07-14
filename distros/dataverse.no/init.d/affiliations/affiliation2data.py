import pandas as pd
import json

#  id  |          dvno_affiliation           | dvno_group_name  | dvno_email_level 
#-----+-------------------------------------+------------------+------------------
# 139 | UiT The Arctic University of Norway | uit.no           |                2
#  27 | Ostfold University College          | hiof.no          |                2
#   4 | Akvaplan-niva                       | akvaplan.niva.no |                3

localfile = '/distrib/private/affiliations.csv'
URLaff = 'https://raw.githubusercontent.com/DataverseNO/dataverse-docker/dataverse.no/distros/dataverse.no/init.d/affiliations/affiliations.csv'

#print(pd.read_csv(open(file, errors='replace')))
def reload_affiliations(loc):
    affiliations = pd.read_csv(loc)
    for i in affiliations.index:
       #print(affiliations.iloc[[i]]['dvno_group_name'])
       #print("%s %s" % (affiliations.iloc[[i]]['dvno_group_name'].astype(str), affiliations.iloc[[i]]['dvno_affiliation'].astype(str)))
       #print(str(affiliations.iloc[[i]]['id'].values[0]))
       #print(str(affiliations.iloc[[i]]['dvno_group_name'].values[0]))
       #print(str(affiliations.iloc[[i]]['dvno_affiliation'].values[0]))
       dvno_email_level = len(str(affiliations.iloc[[i]]['dvno_group_name']).split('.'))
       #print(subdomains)
       affiliation = affiliations.iloc[[i]]['dvno_affiliation'].values[0]
       affiliation = str(affiliation).replace("'", "\'\'")
       #affiliation = "q['%s']" % affiliation
       sql = "insert into dvnoaffiliations (id, dvno_affiliation, dvno_group_name, dvno_email_level) values ('%s', '%s', '%s', '%s');" % (affiliations.iloc[[i]]['id'].values[0], affiliation, affiliations.iloc[[i]]['dvno_group_name'].values[0], dvno_email_level)
       print(sql)
    return

try:
   reload_affiliations(URLaff)
except:
   #print("URL %s doesn't exist\n" % URLaff)
   reload_affiliations(localfile)

