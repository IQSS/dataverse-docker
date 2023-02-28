#!/bin/bash
export PGPASSWORD=`cat /secrets/db/password`
cp -r /secrets/aws-cli/.aws ~


#file=10.21337/OZ4JBV/1869225dfbd-4edecc03da9e

files=`psql -U dataverse dataverse -h postgres  -f ${INIT_SCRIPTS_FOLDER}/cronjob/backupfiles.sql | grep S3 | awk '{split($0,a,"|"); print a[2]}'`

for  file in $files
	do 	
		echo $file
		aws s3 --endpoint https://$aws_endpoint cp s3://$aws_bucket_name/$file  /data/$file
		echo "doneit" 

	done
#echo $files

#cp -r /secrets/aws-cli/.aws ~
#aws s3 --endpoint https://$aws_endpoint cp s3://$aws_bucket_name/$file  /data/$file
