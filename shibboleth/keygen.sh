#! /bin/sh

while getopts n:h:u:g:o:e:y:bf c
     do
         case $c in
           u)         USER=$OPTARG;;
           g)         GROUP=$OPTARG;;
           o)         OUT=$OPTARG;;
           b)         BATCH=1;;
           f)         FORCE=1;;
           h)         FQDN=$OPTARG;;
           e)         ENTITYID=$OPTARG;;
           y)         YEARS=$OPTARG;;
		   n)         PREFIX=$OPTARG;;
		   \?)        echo "keygen [-o output directory (default .)] [-u username to own keypair] [-g owning groupname] [-h hostname for cert] [-y years to issue cert] [-e entityID to embed in cert] [-n filename prefix (default 'sp')]"
                      exit 1;;
         esac
     done
     
if [ -z "$OUT" ] ; then
    OUT=.
fi

if [ -z "$PREFIX" ]; then
	PREFIX="sp"
fi

if [ -n "$FORCE" ] ; then
    rm $OUT/${PREFIX}-key.pem $OUT/${PREFIX}-cert.pem
fi

if  [ -s $OUT/${PREFIX}-key.pem -o -s $OUT/${PREFIX}-cert.pem ] ; then
    if [ -z "$BATCH" ] ; then  
        echo The files $OUT/${PREFIX}-key.pem and/or $OUT/${PREFIX}-cert.pem already exist!
        echo Use -f option to force recreation of keypair.
        exit 2
    fi
    exit 0
fi

if [ -z "$FQDN" ] ; then
    FQDN=`hostname`
fi

if [ -z "$YEARS" ] ; then
    YEARS=10
fi

DAYS=`expr $YEARS \* 365`

if [ -z "$ENTITYID" ] ; then
    ALTNAME=DNS:$FQDN
else
    ALTNAME=DNS:$FQDN,URI:$ENTITYID
fi

SSLCNF=$OUT/${PREFIX}-cert.cnf
cat >$SSLCNF <<EOF
# OpenSSL configuration file for creating keypair
[req]
prompt=no
default_bits=3072
encrypt_key=no
default_md=sha256
distinguished_name=dn
# PrintableStrings only
string_mask=MASK:0002
x509_extensions=ext
[dn]
CN=$FQDN
[ext]
subjectAltName=$ALTNAME
subjectKeyIdentifier=hash
EOF

touch $OUT/${PREFIX}-key.pem
chmod 600 $OUT/${PREFIX}-key.pem
if [ -z "$BATCH" ] ; then
    openssl req -config $SSLCNF -new -x509 -days $DAYS -keyout $OUT/${PREFIX}-key.pem -out $OUT/${PREFIX}-cert.pem
else
    openssl req -config $SSLCNF -new -x509 -days $DAYS -keyout $OUT/${PREFIX}-key.pem -out $OUT/${PREFIX}-cert.pem 2> /dev/null
fi
rm $SSLCNF

if  [ -s $OUT/${PREFIX}-key.pem -a -n "$USER" ] ; then
    chown $USER $OUT/${PREFIX}-key.pem $OUT/${PREFIX}-cert.pem
fi

if  [ -s $OUT/${PREFIX}-key.pem -a -n "$GROUP" ] ; then
    chgrp $GROUP $OUT/${PREFIX}-key.pem $OUT/${PREFIX}-cert.pem
fi
