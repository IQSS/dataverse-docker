#! /bin/sh

while getopts h:u:g:o:f:b: c
     do
         case $c in
           u)         USER=$OPTARG;;
           g)         GROUP=$OPTARG;;
           o)         OUT=$OPTARG;;
           b)         BITS=$OPTARG;;
           f)         FILENAME=$OPTARG;;
           h)         HISTORY=$OPTARG;;
		   \?)        echo "seckeygen [-o output directory (default .)] [-f filename (default sealer.keys)] [-h key history (default 14)] [-b key size in bits (default 128)] [-u owning username] [-g owning groupname]"
                      exit 1;;
         esac
     done
     
if [ -z "$OUT" ] ; then
    OUT=.
fi

if [ -z "$FILENAME" ]; then
	FILENAME="sealer.keys"
fi

if [ -z "$HISTORY" ] ; then
    HISTORY=14
fi

if [ -z "$BITS" ] ; then
    BITS=128
fi

BYTES=`expr $BITS / 8`

rm -f $OUT/${FILENAME}.tmp
touch $OUT/${FILENAME}.tmp
chmod 600 $OUT/${FILENAME}.tmp

KEYVER=1
if [ -f $OUT/${FILENAME} -a $HISTORY -gt 0 ] ; then
    tail -n `expr $HISTORY - 1` $OUT/${FILENAME} > $OUT/${FILENAME}.tmp
    KEYVER=`tail -n 1 $OUT/${FILENAME}.tmp | awk -F: '{print $1}'`
    KEYVER=`expr $KEYVER + 1`
fi
KEYVAL=`openssl rand -base64 $BYTES 2> /dev/null`
echo "${KEYVER}:${KEYVAL}" >> $OUT/${FILENAME}.tmp

mv $OUT/${FILENAME}.tmp $OUT/${FILENAME}

if  [ -s $OUT/${FILENAME} -a -n "$USER" ] ; then
    chown $USER $OUT/${FILENAME}
fi

if  [ -s $OUT/${FILENAME} -a -n "$GROUP" ] ; then
    chgrp $GROUP $OUT/${FILENAME}
fi
