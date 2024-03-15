#!/bin/bash
export PGPASSWORD=`cat /secrets/db/password`
cp -r /secrets/aws-cli/.aws ~

# copy Database to blob and s3
#sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
#wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
#apt update
#apt install postgresql-client-15 -y
#pg_dump -h ${DATAVERSE_DB_HOST} -U ${DATAVERSE_DB_USER} ${POSTGRES_DATABASE} | gzip > /mnt/dataverse.dump.gz

dumpName="dataverse.`date +%Y%m%d_%H%M%z`.dump.gz"

if [ -d "/mntblob/data/databaseDumps/" ]; then
	 cp /mnt/dataverse.dump.gz /mntblob/data/databaseDumps/${dumpName}
fi

aws s3 --endpoint https://$aws_endpoint cp /mnt/dataverse.dump.gz s3://$aws_bucket_name/databaseDumps/${dumpName}

# backup files
#file=10.21337/OZ4JBV/1869225dfbd-4edecc03da9e
files=`psql -h ${DATAVERSE_DB_HOST} -U ${DATAVERSE_DB_USER} ${POSTGRES_DATABASE} -f ${INIT_SCRIPTS_FOLDER}/cronjob/backupfiles.sql | grep S3 | awk '{split($0,a,"|"); print a[2]}' | sed "s/S3:\/\/$aws_bucket_name://"`

for  file in $files
	do 	
		if [ -f /data/$file ]; then
		echo "$file already copied" 
		else
			aws s3 --endpoint https://$aws_endpoint cp s3://$aws_bucket_name/$file  /data/$file
			echo "doneit" 
		fi

	done
#echo $files

rm -rf ~/.aws

#cp -r /secrets/aws-cli/.aws ~
#aws s3 --endpoint https://$aws_endpoint cp s3://$aws_bucket_name/$file  /data/$file
