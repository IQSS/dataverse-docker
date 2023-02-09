#!/usr/bin/bash

DECLS=1

TYPE="SHIB"

SAML1=0
SAML2=0
ARTIFACT=0
DS=0
MDUI=0
LOGOUT=0
NAMEIDMGMT=0

SAML10PROT="urn:oasis:names:tc:SAML:1.0:protocol"
SAML11PROT="urn:oasis:names:tc:SAML:1.1:protocol"
SAML20PROT="urn:oasis:names:tc:SAML:2.0:protocol"

SAML20SOAP="urn:oasis:names:tc:SAML:2.0:bindings:SOAP"
SAML20REDIRECT="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect"
SAML20POST="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
SAML20POSTSS="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST-SimpleSign"
SAML20ART="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact"
SAML20PAOS="urn:oasis:names:tc:SAML:2.0:bindings:PAOS"

SAML1POST="urn:oasis:names:tc:SAML:1.0:profiles:browser-post"
SAML1ART="urn:oasis:names:tc:SAML:1.0:profiles:artifact-01"

while getopts a:c:e:f:h:l:n:o:s:t:u:y:d:T:12ADLNOU c
     do
         case $c in
           c)   CERTS[${#CERTS[*]}]=$OPTARG;;
           e)   ENTITYID=$OPTARG;;
           f)   FORMATS[${#FORMATS[*]}]=$OPTARG;;
           h)   HOSTS[${#HOSTS[*]}]=$OPTARG;;
           l)   HOSTLIST=$OPTARG;;
           n)   NAKEDHOSTS[${#NAKEDHOSTS[*]}]=$OPTARG;;
           o)   ORGNAME=$OPTARG;;
           a)   ADMIN[${#ADMIN[*]}]=$OPTARG;;
           s)   SUP[${#SUP[*]}]=$OPTARG;;
           t)   TECH[${#TECH[*]}]=$OPTARG;;
           u)   URL=$OPTARG;;
           y)   DISPLAYNAME=$OPTARG;;
           d)   DESC=$OPTARG;;
           1)   SAML1=1;;
           2)   SAML2=1;;
           A)   ARTIFACT=1;;
           D)   DS=1;;
           L)   LOGOUT=1;;
           N)   NAMEIDMGMT=1;;
           O)   DECLS=0;;
           T)   TYPE=$OPTARG;;
           U)   MDUI=1;;
           \?)  echo metagen [-12ADLNOU] -c cert1 [-c cert2 ...] -h host1 [-h host2 ...] [-e entityID]
                exit 1;;
         esac
     done

if [ ! -z $HOSTLIST ] ; then
    if [ -s $HOSTLIST ] ; then
        while read h
        do
            HOSTS[${#HOSTS[@]}]=$h
        done <$HOSTLIST
    else
        echo File with list of hostnames $l does not exist! 
        exit 2
    fi
fi

if [ ${#HOSTS[*]} -eq 0 -a ${#NAKEDHOSTS[*]} -eq 0 ] ; then
    echo metagen [-12ADLN] -c cert1 [-c cert2 ...] -h host1 [-h host2 ...] [-e entityID]
    exit 1
fi

if [ ${#CERTS[*]} -eq 0 ] ; then
    CERTS[${#CERTS[*]}]=sp-cert.pem
fi

for c in ${CERTS[@]}
do
    if  [ ! -s $c ] ; then
        echo Certificate file $c does not exist! 
        exit 2
    fi
done

if [ $TYPE == "SHIB" ] ; then
    EIDSUFFIX=shibboleth
elif [ $TYPE == "SSP" ] ; then
    EIDSUFFIX=simplesaml
else
    echo "Unknown type: $TYPE \(SHIB and SSP are supported\)"
    exit 3
fi


if [ -z $ENTITYID ] ; then
    if [ ${#HOSTS[*]} -eq 0 ] ; then
        ENTITYID=https://${NAKEDHOSTS[0]}/$EIDSUFFIX
    else
        ENTITYID=https://${HOSTS[0]}/$EIDSUFFIX
    fi
fi

# Establish protocols and bindings.

if [ $SAML1 -eq 0 -a $SAML2 -eq 0 ] ; then
    SAML1=1
    SAML2=1
fi

if [ $LOGOUT -eq 1 ] ; then
    SAML2=1
    if [ $TYPE == "SHIB" ] ; then
        SLO[${#SLO[*]}]=$SAML20SOAP
        SLO[${#SLO[*]}]=$SAML20REDIRECT
        SLO[${#SLO[*]}]=$SAML20POST
        SLOLOC[${#SLOLOC[*]}]="Shibboleth.sso/SLO/SOAP"
        SLOLOC[${#SLOLOC[*]}]="Shibboleth.sso/SLO/Redirect"
        SLOLOC[${#SLOLOC[*]}]="Shibboleth.sso/SLO/POST"
    elif [ $TYPE == "SSP" ] ; then
        SLO[${#SLO[*]}]=$SAML20SOAP
        SLO[${#SLO[*]}]=$SAML20REDIRECT
        SLOLOC[${#SLOLOC[*]}]="simplesaml/module.php/saml/sp/saml2-logout.php/default-sp"
        SLOLOC[${#SLOLOC[*]}]="simplesaml/module.php/saml/sp/saml2-logout.php/default-sp"
    fi
    if [ $ARTIFACT -eq 1 -a $TYPE == "SHIB" ] ; then
        SLO[${#SLO[*]}]=$SAML20ART
        SLOLOC[${#SLOLOC[*]}]="Shibboleth.sso/SLO/Artifact"
    fi
fi

if [ $NAMEIDMGMT -eq 1 -a $TYPE == "SHIB" ] ; then
    SAML2=1
    NIM[${#NIM[*]}]=$SAML20SOAP
    NIM[${#NIM[*]}]=$SAML20REDIRECT
    NIM[${#NIM[*]}]=$SAML20POST
    NIMLOC[${#NIMLOC[*]}]="Shibboleth.sso/NIM/SOAP"
    NIMLOC[${#NIMLOC[*]}]="Shibboleth.sso/NIM/Redirect"
    NIMLOC[${#NIMLOC[*]}]="Shibboleth.sso/NIM/POST"
    if [ $ARTIFACT -eq 1 -a $TYPE == "SHIB" ] ; then
        NIM[${#NIM[*]}]=$SAML20ART
        NIMLOC[${#NIMLOC[*]}]="Shibboleth.sso/NIM/Artifact"
    fi
fi

if [ $SAML1 -eq 1 -a $SAML2 -eq 1 ] ; then
    PROTENUM="$SAML20PROT $SAML11PROT"
elif [ $SAML1 -eq 1 ] ; then
    PROTENUM="$SAML11PROT"
else
    PROTENUM="$SAML20PROT"
fi

if [ $SAML2 -eq 1 ] ; then
    if [ $TYPE == "SHIB" ] ; then
        ACS[${#ACS[*]}]=$SAML20POST
        ACSLOC[${#ACSLOC[*]}]="Shibboleth.sso/SAML2/POST"
        ACS[${#ACS[*]}]=$SAML20POSTSS
        ACSLOC[${#ACSLOC[*]}]="Shibboleth.sso/SAML2/POST-SimpleSign"
        if [ $ARTIFACT -eq 1 ] ; then
            ACS[${#ACS[*]}]=$SAML20ART
            ACSLOC[${#ACSLOC[*]}]="Shibboleth.sso/SAML2/Artifact"
        fi
        ACS[${#ACS[*]}]=$SAML20PAOS
        ACSLOC[${#ACSLOC[*]}]="Shibboleth.sso/SAML2/ECP"
    elif [ $TYPE == "SSP" ] ; then
        ACS[${#ACS[*]}]=$SAML20POST
        ACSLOC[${#ACSLOC[*]}]="simplesaml/module.php/saml/sp/saml2-acs.php/default-sp"
        if [ $ARTIFACT -eq 1 ] ; then
            ACS[${#ACS[*]}]=$SAML20ART
            ACSLOC[${#ACSLOC[*]}]="simplesaml/module.php/saml/sp/saml2-acs.php/default-sp"
        fi
    fi
fi

if [ $SAML1 -eq 1 ] ; then
    if [ $TYPE == "SHIB" ] ; then
        ACS[${#ACS[*]}]=$SAML1POST
        ACSLOC[${#ACSLOC[*]}]="Shibboleth.sso/SAML/POST"
        if [ $ARTIFACT -eq 1 ] ; then
            ACS[${#ACS[*]}]=$SAML1ART
            ACSLOC[${#ACSLOC[*]}]="Shibboleth.sso/SAML/Artifact"
        fi
    elif [ $TYPE == "SSP" ] ; then
        ACS[${#ACS[*]}]=$SAML1POST
        ACSLOC[${#ACSLOC[*]}]="simplesaml/module.php/saml/sp/saml1-acs.php/default-sp"
        if [ $ARTIFACT -eq 1 ] ; then
            ACS[${#ACS[*]}]=$SAML1ART
            ACSLOC[${#ACSLOC[*]}]="simplesaml/module.php/saml/sp/saml1-acs.php/default-sp/artifact"
        fi
    fi
fi

if [ $DECLS -eq 1 ] ; then
    DECLS="xmlns:md=\"urn:oasis:names:tc:SAML:2.0:metadata\" xmlns:ds=\"http://www.w3.org/2000/09/xmldsig#\" "
    if [ $DS -eq 1 ] ; then
        DECLS="${DECLS}xmlns:disco=\"urn:oasis:names:tc:SAML:profiles:SSO:idp-discovery-protocol\" "
    fi
    if [ $MDUI -eq 1 ] ; then
        DECLS="${DECLS}xmlns:mdui=\"urn:oasis:names:tc:SAML:metadata:ui\" "
    fi
else
    DECLS=""
fi

cat <<EOF
<md:EntityDescriptor ${DECLS}entityID="${ENTITYID}">
  <md:SPSSODescriptor protocolSupportEnumeration="${PROTENUM}">
EOF

# Discovery BEGIN
if [ $DS -eq 1 -a $TYPE == "SHIB" -o $MDUI -eq 1 ] ; then

cat << EOF
    <md:Extensions>
EOF

if [ $MDUI -eq 1 ] ; then
  cat << EOF
        <mdui:UIInfo>
EOF

  if [ -n "$DISPLAYNAME" ] ; then
    cat << EOF
            <mdui:DisplayName xml:lang="en">$DISPLAYNAME</mdui:DisplayName>
EOF
  fi

  if [ -n "$DESC" ] ; then
    cat << EOF
            <mdui:Description xml:lang="en">$DESC</mdui:Description>
EOF
  fi

  cat << EOF
        </mdui:UIInfo>
EOF
fi

if [ $DS -eq 1 -a $TYPE == "SHIB" ] ; then
  count=1
  for h in ${HOSTS[@]}
  do
    cat << EOF
      <disco:DiscoveryResponse Binding="urn:oasis:names:tc:SAML:profiles:SSO:idp-discovery-protocol" Location="https://$h/Shibboleth.sso/Login" index="$count"/>
EOF
    let "count++"
  done

  for h in ${NAKEDHOSTS[@]}
  do
    cat << EOF
      <disco:DiscoveryResponse xmlns="urn:oasis:names:tc:SAML:profiles:SSO:idp-discovery-protocol" Binding="urn:oasis:names:tc:SAML:profiles:SSO:idp-discovery-protocol" Location="http://$h/Shibboleth.sso/Login" index="$count"/>
EOF
    let "count++"
  done
fi

cat << EOF
    </md:Extensions>
EOF

fi
# Discovery END

for c in ${CERTS[@]}
do
cat << EOF
    <md:KeyDescriptor>
      <ds:KeyInfo>
        <ds:X509Data>
          <ds:X509Certificate>
EOF
grep -v ^- $c
cat << EOF
          </ds:X509Certificate>
        </ds:X509Data>
      </ds:KeyInfo>
    </md:KeyDescriptor>
EOF
done

# Logout BEGIN
if [ $LOGOUT -eq 1 ] ; then

for h in ${HOSTS[@]}
do
  count=0
  while [ $count -lt ${#SLO[*]} ]
  do
    cat <<EOF
    <md:SingleLogoutService Binding="${SLO[$count]}" Location="https://$h/${SLOLOC[$count]}"/>
EOF
    let "count++"
  done
done

for h in ${NAKEDHOSTS[@]}
do
  count=0
  while [ $count -lt ${#SLO[*]} ]
  do
    cat <<EOF
    <md:SingleLogoutService Binding="${SLO[$count]}" Location="http://$h/${SLOLOC[$count]}"/>
EOF
    let "count++"
  done
done

fi
# Logout END

#  NameID Mgmt BEGIN
if [ $NAMEIDMGMT -eq 1 -a $TYPE == "SHIB" ] ; then

for h in ${HOSTS[@]}
do
  count=0
  while [ $count -lt ${#NIM[*]} ]
  do
    cat <<EOF
    <md:ManageNameIDService Binding="${NIM[$count]}" Location="https://$h/${NIMLOC[$count]}"/>
EOF
    let "count++"
  done
done

for h in ${NAKEDHOSTS[@]}
do
  count=0
  while [ $count -lt ${#NIM[*]} ]
  do
    cat <<EOF
    <md:ManageNameIDService Binding="${NIM[$count]}" Location="http://$h/${NIMLOC[$count]}"/>
EOF
    let "count++"
  done
done

fi
# NameID Mgmt END

for f in ${FORMATS[@]}
do
cat << EOF
    <md:NameIDFormat>$f</md:NameIDFormat>
EOF
done

index=0
for h in ${HOSTS[@]}
do
  count=0
  while [ $count -lt ${#ACS[*]} ]
  do
    cat <<EOF
    <md:AssertionConsumerService Binding="${ACS[$count]}" Location="https://$h/${ACSLOC[$count]}" index="$((index+1))"/>
EOF
    let "count++"
    let "index++"
  done
done

for h in ${NAKEDHOSTS[@]}
do
  count=0
  while [ $count -lt ${#ACS[*]} ]
  do
    cat <<EOF
    <md:AssertionConsumerService Binding="${ACS[$count]}" Location="http://$h/${ACSLOC[$count]}" index="$((index+1))"/>
EOF
    let "count++"
    let "index++"
  done
done

cat <<EOF 
  </md:SPSSODescriptor>
EOF

if [ -n "$ORGNAME" ] ; then
  if [ -z "$URL" ] ; then
    URL=$ENTITYID
  fi
  cat <<EOF
  <md:Organization>
    <md:OrganizationName xml:lang="en">$ORGNAME</md:OrganizationName>
    <md:OrganizationDisplayName xml:lang="en">$ORGNAME</md:OrganizationDisplayName>
    <md:OrganizationURL xml:lang="en">$URL</md:OrganizationURL>
  </md:Organization>
EOF
fi

count=${#ADMIN[*]}
for (( i=0; i<count; i++ ))
do
  IFS="/"; declare -a c=(${ADMIN[$i]})
  cat <<EOF
  <md:ContactPerson contactType="administrative">
    <md:GivenName>${c[0]}</md:GivenName>
    <md:SurName>${c[1]}</md:SurName>
    <md:EmailAddress>${c[2]}</md:EmailAddress>
  </md:ContactPerson>
EOF
done

count=${#SUP[*]}
for (( i=0; i<count; i++ ))
do
  IFS="/"; declare -a c=(${SUP[$i]})
  cat <<EOF
  <md:ContactPerson contactType="support">
    <md:GivenName>${c[0]}</md:GivenName>
    <md:SurName>${c[1]}</md:SurName>
    <md:EmailAddress>${c[2]}</md:EmailAddress>
  </md:ContactPerson>
EOF
done

count=${#TECH[*]}
for (( i=0; i<count; i++ ))
do
  IFS="/"; declare -a c=(${TECH[$i]})
  cat <<EOF
  <md:ContactPerson contactType="technical">
    <md:GivenName>${c[0]}</md:GivenName>
    <md:SurName>${c[1]}</md:SurName>
    <md:EmailAddress>${c[2]}</md:EmailAddress>
  </md:ContactPerson>
EOF
done

cat <<EOF 
</md:EntityDescriptor>

EOF

